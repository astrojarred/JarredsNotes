
# Lecture 1
### January 9, 2017 (Morning)

### Before we start:
1. Install Anaconda v. 2.7
2. Create a git account
3. Understand how to run Jupyter Notebook

### Todo list—
1. Markdown introduction
2. Writing code in Jupyter
3. Basic UNIX Commands

## 1. Markdown introduction

- Use markdown when you just want something to appear as nice text.
- Great reference on github
  - https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet

### Headers
#Main Header
##Sub-header
###Smaller Header
####Sub sub header
#####teehee

### Shortcuts

**Esc+M** --> Markdown

**Esc+Y** --> Code

**Shift+Return** --> Execute cell


### Formatting

**bold**

*italic*

***bold italic***

~~strikethrough~~

### Lists

- Item 1
- Item 2
- Item 3
  * item 3a
  * item 3b
  

### Mathematics
- put between dollar signs

$10^2$

$\log 12 * x$

$(a+b)/c$

$\frac{1}{2}$

### Block Quotes

> This is a block quote

### Tables

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3



| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

### Writing code

- python example

```python
import sys
```

- bash example

```bash
cd /Home/....
ls -l
```






## 2. Writing code in Jupyter

- You can write bash also in here using the prefix 
  - %%bash
- If you execute these it will print results!
- See e.g. below


```python
%%bash
echo 'Hello World'
```

    Hello World



```python
! whoami
```

    jarredgreen


## 3. Basic UNIX Commands

***Process code*** | ***Description*** | **Useful Arguements**
---|---|---
**ps -a** | shows all processes |
**ps -u jarredgreen** | shows processes of my user and process numbers |
**ps -u jarredgreen &#124; grep jup** | filters processes that contain "jup" and shows the process number |
**kill -9 %i** | kills process #i |
**bg** | runs a process in the background |
**fg %i** | brings a process back to the forground |
**whoami** | current user |
**pwd** | shows current directory |
**ls** | lists files in current directory | *-F* gives more details, *-a* shows hidden files too, *-t* orders by time, *-l* more info with privileges, \*.extension shows files with that extension, \* is a wildcard
**cd /filepath** | change directory to filepath |
**cd ..** | takes you to higher directory |
**man 'command'** | shows instructions for 'command' |
**mkdir 'folder name'** | creates a folder named 'folder name' |
**rmdir 'folder'** | will remove empty folder |
**mv** | moves a file or directory |
**rm** | deletes a file |
**history** | shows recent entries |
**cp** | copies files | *cp \*.txt directory* copies file to new name/place, *cp -r* copies recursively to another location
**vim** or **nano** | document editor |

___

# Lecture 2
### January 9, 2017 (Afternoon)

- Continuing with bash / unix commands

### Todo list—
1. Pipes and chaining
2. Wildcards
3. Basic Scripting
4. Arrays
5. Grep
6. Find
7. Substitute Strings

### 1. Pipes and chaining

- **wc** shows charactercounts of files
- **wc -w** shows wordcounts
- **wc -l** shows line count


```python
%%bash
wc *.ipynb
```

         276     714    5797 Lecture 1-Copy1.ipynb
         276     729    5885 Lecture 1.ipynb
          46      85     807 Lecture 2.ipynb
         598    1528   12489 total



```python
%%bash
wc -w *.ipynb
```

         714 Lecture 1-Copy1.ipynb
         729 Lecture 1.ipynb
          85 Lecture 2.ipynb
        1528 total


- Let's write the line counts to a file called "lengths"


```python
%%bash
wc -l *.ipynb > lengths
```

- Now let's add more information to the file using the double **>>**


```python
%%bash
wc -w *.ipynb >> lengths
```


```python
more lengths
```

**more** shows an overview of the file, **cat** prints all contents.


```python
%%bash
cat lengths
```

         276 Lecture 1-Copy1.ipynb
         276 Lecture 1.ipynb
          46 Lecture 2.ipynb
         598 total
         714 Lecture 1-Copy1.ipynb
         729 Lecture 1.ipynb
          85 Lecture 2.ipynb
        1528 total


- Now let's try **sort**ing the file


```python
%%bash
sort -n lengths > sorted-lengths.txt
```


```python
%%bash
cat sorted-lengths.txt
```

          46 Lecture 2.ipynb
          85 Lecture 2.ipynb
         276 Lecture 1-Copy1.ipynb
         276 Lecture 1.ipynb
         598 total
         714 Lecture 1-Copy1.ipynb
         729 Lecture 1.ipynb
        1528 total


- **head -n 1** and **tail -n 1** will print the first or the last line of the file
  - -n means "numerically"


```python
%%bash
tail -n 1 sorted-lengths.txt
```

        1528 total



```python
%%bash
head -n 1 sorted-lengths.txt
```

          46 Lecture 2.ipynb


- **you can use pipes to chain commands**
- the following says
  - print line counts of files ending in .ipynb | then sort those entries numerically and > export to a text file


```python
%%bash
wc -l *.ipynb | sort -n > newsort.txt
```


```python
%%bash
cat newsort.txt
```

          46 Lecture 2.ipynb
         276 Lecture 1-Copy1.ipynb
         276 Lecture 1.ipynb
         598 total


- now let's just create some files for the sake of this example


```python
%%bash
echo 'first line
second line
third line' > lines.ipynb
```


```python
%%bash
echo 'lion
panther
person
tiger' > animals.txt
```

- can we find the second smallest file in length in one line of code?


```python
%%bash
wc -l *.ipynb
```

           4 animals.ipynb



```python
%%bash
wc -l *.ipynb | sort -n
```

           3 lines.ipynb
           4 animals.ipynb
          46 Lecture 2.ipynb
         276 Lecture 1-Copy1.ipynb
         551 Lecture 1.ipynb
         880 total



```python
%%bash
wc -l *.ipynb | sort -n | head -2
```

           3 lines.ipynb
           4 animals.ipynb



```python
%%bash
wc -l *.ipynb | sort -n | head -2 | tail -1
```

           4 animals.ipynb


- **we did it!**

### 2. Wildcards

**command** | **meaning**
--- | ---
\* | any string of any length
? | any single character
[a-r] | everything from a-r
\*[1-9]\* | everthing with a number from 1-9 in the middle (FROM)
[!a] | everyhing excluding "a" (NOT)
{\*doc, \*pdf} | lets you pick multiple things (OR)
[^a] | beginning of line
[\$a] | a at end of line

- **tr**, **cut**, **uniq** commands

**command** | **meaning** | **extensions**
--- | --- | ---
**tr** | translates characters | **-s** squeezes characters together, 
**cut** | divide a file into separate parts | **cut -c x-y** selects charaters in position x-y
**uniq** | show only unique values |

**uniq**
- See example below for uniq


```python
%%bash
#make a file with numbers:
echo '1
1
2
3
5
8
13' > numbers.txt
```


```python
%%bash
cat numbers.txt
```

    1
    1
    2
    3
    5
    8
    13



```python
%%bash
cat numbers.txt | sort -n | uniq
```

    1
    2
    3
    5
    8
    13


**cut:**


```python
%%bash
wc -l *.ipynb | cut -c 8-25
```

    6 Lecture 1-Copy1.
    7 Lecture 1.ipynb
    6 Lecture 2.ipynb
    4 animals.ipynb
    3 lines.ipynb
    6 total


**tr:**

-squeeze:


```python
%%bash
echo 'A beautiful     morning in Innsbruck' | tr -s " "
```

    A beautiful morning in Innsbruck



```python
%%bash
echo 'A beautifulllll morning in Innsbruck' | tr -s "l"
```

    A beautiful morning in Innsbruck


**tr "x" "y"** replaces x with y

- in this example "/n" means a "line break"
- so, replace line break with spaces:


```python
%%bash
echo 'A
beautiful
morning
in
Innsbruck' | tr "\n" " "
```

    A beautiful morning in Innsbruck 

### 3. Basic Scripting

- Let's write a simple script (using a loop) to replicate the **ls** function


```python
%%bash
#this code replicates the basic ls function on unix, listing files in the directory
for filename in *.ipynb
    do
        echo 'This file is: '$filename
    done
```

    This file is: Lecture 1-Copy1.ipynb
    This file is: Lecture 1.ipynb
    This file is: Lecture 2.ipynb
    This file is: animals.ipynb
    This file is: lines.ipynb


- Can we do the same thing, saving it to a file?


```python
%%bash
#what does the line belwo do? Shibang line
echo '#/usr/bin/env bash
echo 'This takes all .txt files, prints the filename, and prints the last five lines!'
for filename in *.txt
do
    echo "This file is: "$filename
    tail -5 $filename
done' > script.sh
#save file to a script
chmod +x script.sh
# makes the file executable
```


```python
%%bash
ls -F script.sh
```

    script.sh*



```python
%%bash
./script.sh
```

    This takes all .txt files, prints the filename, and prints the last five lines!
    This file is: newsort.txt
          46 Lecture 2.ipynb
         276 Lecture 1-Copy1.ipynb
         276 Lecture 1.ipynb
         598 total
    This file is: numbers.txt
    2
    3
    5
    8
    13
    This file is: sorted-lengths.txt
         276 Lecture 1.ipynb
         598 total
         714 Lecture 1-Copy1.ipynb
         729 Lecture 1.ipynb
        1528 total


**- Or you can do it all in one line:**


```python
# I missed this code, but he somehow used semi-colons to separate the lines
```

### 4. Arrays

- The following is how you should format arrays in bash


```python
ARRAY=("val1""val2""val3")

#or...
ARRAY=(
"val1"
"val2"
"val3"
)
```

- Ok not really sure what the next one is doing, and it's hard to make comments in there


```python
%%bash
echo '#/usr/bin/env bash' > script3.sh
echo '
dir0="/dir/"
ARRAY=(
"val1"
"val2"
"val3"
)
echo "2nd value is "${ARRAY[1]}
for name in "${ARRAY[@]}"
do
    echo $dir0$name
done
' >> script3.sh

chmod +x script3.sh
```


```python
%%bash
./script3.sh
```

    2nd value is val2
    /dir/val1
    /dir/val2
    /dir/val3


### 5. Grep

**grep** is great at searching through documents for you
Below we created a document with a few words:

**Arguments** | **function**
--- | ---
-n | gives line number
-i | ignore case
-w | the expression is searched for as a word
-v | gives inverse
-e | specify a pattern used during search


```python
%%bash
echo 'mars
earth
jupiter
saturn
venus' > planets_list.txt
```

- see the below examples


```python
%%bash
grep u planets_list.txt
```

    jupiter
    saturn
    venus



```python
%%bash
grep ur planets_list.txt
```

    saturn



```python
%%bash
grep "t.r" planets_list.txt
```

    jupiter
    saturn



```python
%%bash
grep "u[rs]" planets_list.txt
```

    saturn
    venus


- these things like "t.r" are called "regular expressions" and have many rules and can be quite complex.
- see the wikipedia page for all different (crazy) rules
  - https://en.wikipedia.org/wiki/Regular_expression

### Examples
- from wikipedia

**Regular Expressions**


**Example** | **Function**
--- | ---
.at | matches any three-character string ending with "at", including "hat", "cat", and "bat"
[hc]at | matches "hat" and "cat".
[^b]at | matches all strings matched by .at except "bat".
[^hc]at | matches all strings matched by .at other than "hat" and "cat".
^[hc]at | matches "hat" and "cat", but only at the beginning of the string or line.
[hc]at$ | matches "hat" and "cat", but only at the end of the string or line.
\[.\] | matches any single character surrounded by "[" and "]" since the brackets are escaped, for example: "[a]" and "[b]".
s.* | matches s followed by zero or more characters, for example: "s" and "saw" and "seed".

### 6. Find

**find** will walk through a directory in all sub-folders and find files

**Arguments** | **function**
--- | ---
-type d | looks for directories


```python
%%bash
find .
```

    .
    ./.DS_Store
    ./.ipynb_checkpoints
    ./.ipynb_checkpoints/Lecture 1-checkpoint.ipynb
    ./.ipynb_checkpoints/Lecture 1-Copy1-checkpoint.ipynb
    ./.ipynb_checkpoints/Lecture 2-checkpoint.ipynb
    ./animals.ipynb
    ./Lecture 1-Copy1.ipynb
    ./Lecture 1.ipynb
    ./Lecture 2.ipynb
    ./lines.ipynb
    ./newsort.txt
    ./numbers.txt
    ./planets_list.txt
    ./script.sh
    ./script3.sh
    ./sorted-lengths.txt



```python
%%bash
#list all directories starting from the one above
find .. -type d
```

    ..
    ../Advanced Mathematics
    ../Advanced Mathematics/Lecture
    ../Advanced Mathematics/Lecture/Lecture Notes
    ../Advanced Mathematics/Lecture/Study Guides
    ../Advanced Mathematics/Proseminar
    ../Advanced Mathematics/Proseminar/Exams
    ../Advanced Mathematics/Proseminar/PS Exercise Sheets
    ../Advanced Mathematics/Proseminar/PS Homework
    ../Advanced Mathematics/Proseminar/PS Homework/Solutions
    ../Advanced Mathematics/Proseminar/PS Homework/Solutions/From Professors
    ../Advanced Mathematics/Proseminar/PS Homework/Solutions/Javier Solutions
    ../Baysean
    ../Concepts of Physics
    ../Concepts of Physics/Lectures
    ../Concepts of Physics/Lectures/Lecture Homework
    ../Concepts of Physics/Lectures/Lecture Homework/HW1 Resources
    ../Concepts of Physics/Lectures/Lecture Homework/Javier Solutions
    ../Concepts of Physics/Lectures/Lecture Notes
    ../Concepts of Physics/Lectures/Resources
    ../Concepts of Physics/Lectures/Resources/Adrian's Notes
    ../Concepts of Physics/Lectures/Resources/Agata's Quantum Notes
    ../Concepts of Physics/Lectures/Resources/All Previous Assignments and Exams
    ../Concepts of Physics/Lectures/Resources/Atomic Notes
    ../Concepts of Physics/Lectures/Resources/Study Guides
    ../Concepts of Physics/Proseminar
    ../Concepts of Physics/Proseminar/Homework Scans
    ../Concepts of Physics/Proseminar/PS Excercise Sheets
    ../Concepts of Physics/Proseminar/PS Excercise Sheets/Solutions
    ../Concepts of Physics/Proseminar/PS Excercise Sheets/Solutions/Javier Solutions
    ../Concepts of Physics/Proseminar/PS Excercise Sheets/Solutions/Javier Solutions/Tutorial_Solutions_exercise6
    ../Concepts of Physics/Proseminar/PS Homework
    ../Concepts of Physics/Proseminar/PS Homework/Solutions
    ../Concepts of Physics/Proseminar/PS Homework/Solutions/From Professors
    ../Concepts of Physics/Proseminar/PS Homework/Solutions/Javier Solutions
    ../Extragalactic
    ../Extragalactic/Lecture
    ../Extragalactic/Lecture/Lecture Notes
    ../Extragalactic/Proseminar
    ../Extragalactic/Proseminar/Exercises
    ../Extragalactic/Proseminar/Homework
    ../Extragalactic/Proseminar/Homework/Assignments
    ../Extragalactic/Proseminar/Homework/Corrected
    ../Extragalactic/Proseminar/Homework/Submitted
    ../Extragalactic/Proseminar/Resources
    ../Forms
    ../Galactic
    ../Galactic/Proseminar
    ../Galactic/Proseminar/Exercise Sheets
    ../Galactic/Proseminar/Homework
    ../Galactic/Proseminar/Homework/Assignments
    ../Galactic/Proseminar/Homework/Corrected
    ../Galactic/Proseminar/Homework/Submitted
    ../German
    ../Programming
    ../Programming/.ipynb_checkpoints



```python
%%bash
# you can also use find as an argument for another command
wc -l $(find .. -name '*.txt')
```

           4 ../Programming/newsort.txt
           7 ../Programming/numbers.txt
           5 ../Programming/planets_list.txt
           8 ../Programming/sorted-lengths.txt
          24 total


- Finally, we can see how to pass arguments to find


```python
%%bash
#not sure what this one is doing, look further into it
find .. -name '*.txt' -exec dirname {} \; | uniq
```

    ../Programming


### 7. Substitute Strings

ways to do this include **sed**, **awk**, and **perl**

**sed** usually does this trick

-in the following case it's kind of like find and replace


```python
%%bash
echo 'The cat runs on the roof' | sed 's/run/walk/'
```

    The cat walks on the roof


- In this eample we will use perl to do this


```python
%%bash
echo 'This file is rotten' > rotten.txt
cat rotten.txt
perl -pi -e 's/rotten/fresh/' rotten.txt
# -e implies that this is a regular expression
cat rotten.txt
```

    This file is rotten
    This file is fresh


-------

# Lecture 3
### January 10, 2017 (Morning)

### Todo list—
1. Create repository on Github
2. Github Version Control
3. Git commands

## 1. Github Repository
- just go to the website and make a new repository 

## 2. Github Version Control
- keeps track of every change in your code
- backs up remotely
- allows for remote collaboration
- shows who has made each edit

#### Terminology

**Word** | **Definition**
--- | ---
Repository | where source code is stored
Checkout | download a local copy of the files
Commit | saving modification
Master | the current release version of the file
Branch | a working copy of the master that you can edit
Merge | merging the current branch with the current master
Conflict | when you must pick between code from the master or the branch
Forking | creating a new branch
Clone | making a copy of the repository (and history) on the local machine
Pull | grab code from cloud
Push | upload local code to the repository

#### Git Configuration on the local machine

```bash
git config --global user.name "your name"
git config --global user.email "your email"
git config --global color.ui "auto"
git config --global core.editor "vim"
```


```python
%%bash
git config --list
```

    credential.helper=osxkeychain
    user.name=astrojarred
    user.email=astrojarred@gmail.com
    core.editor=vim
    color.ui=auto


## 3. Git Commands

**Make a Repository**

```bash
mkdir Repos
cd Repos
git init Repos
```


**Clone a repository**

```bash
git clone https://github.com/User/Your_Repository
```

**Check the status of the repository**

```bash
git status
```

**Adding a file**
```bash
git add filename
git status
```

-add all files
```bash
git add .
```

**Committing a change**
```bash
git commit -m "your comments" filename
```

**Uploading changes to github**
```bash
git push
```

**Seeing log of changes**
```bash
git log
```

----

#### Let's add and remove a temporary file as a test:

- Create a file and commit

```bash
echo '' > tmpfile
```

```bash
git add tempfile
git commit -m "Created a tmpfile" tmpfile
```

- Delete the file and commit

```bash
rm tmpfile
```

```bash
git commit -m "Deleted the tmpfile" tmpfile
```

- Check the log

```bash
git log
```

- Checks just the most recent log item

```bash
git log -1
```
