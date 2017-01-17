
# Programming for Astrophysics — Lecture notes
**Jarred Green**

**astrojarred@gmail.com**

## Contents:
  ### Lecture 1 — Setting up
    1. Markdown introduction
    2. Writing code in Jupyter
    3. Basic UNIX Commands
  ### Lecture 2 — Introduction to UNIX commands
    1. Pipes and chaining
    2. Wildcards
    3. Basic Scripting
    4. Arrays
    5. Grep
    6. Find
    7. Substitute Strings
  ### Lecture 3 — Introduction to Git
    1. Create repository on Github
    2. Github Version Control
    3. Git commands
  ### Lecture 4 — Introduction to Python!
    1. Clone Dario's Repository
    2. Command aliases
    3. Introduction to Python!
  ### Lecture 5 — Introduction to Python II + Plotting
    1. Tuples
    2. Dictionaries
    3. Control Flow
    4. Loops
    5. Functions
    6. Classes
    7. Modules
    8. Try and Accept
    9. Plotting
  ### Lecture 6 — GUI Programming and Widgets
    1. Install wxpython
    2. Our first application: "Hello, World"
    3. A simple text editor
    4. Status bars & Menu bars
    5. Event Handling
    6. Buttons
    
  ### Lecture 7 — More Widgets
    1. A multi-featured widget
    2. Notebook Demo
    3. Adding a grid
  ### Lecture 8 — Intro to astro py
    1. setup
    2. intro to FITS Files
    3. opening FITS files in a more general way
    4. coordinate transformations
    5. cutouts
    6. saving a FITS files
    7. tables in astropy
    8. making a table
    9. astronomical units
    10. astronomical constants
    11. astronomical query
    12. histograms
  ### Lecture 9 — Work on project
    1. project outline
    2. work on project
  ### Lecture 10 — Intro to numpy
    1. creating arrays
    2. linspace and logspace
    3. 2D arrays
    4. random numbers
    5. diagonal matricies
    6. working with CSVs
    7. numpy native format .npy
    8. more numpy features
    9. manipulating arrays
    
    
--------

# Lecture 1 — Setting up
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

# Lecture 2 — Introduction to UNIX commands
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

# Lecture 3 — Introduction to Git
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

# Lecture 4  — Introduction to Python
### January 11, 2017 (Morning)

### Todo list—
1. Clone Dario's Repository
2. Command aliases
3. Introduction to Python!

## 1. Cloning Repositories

```bash
git clone http://www.github.com/darioflute/CS4A.git
```

- now cd into the folder
```bash
cd CS4A
```

- now try to update the repository
- it should say "up to date"
```bash
git pull origin master
```

## 2. Command aliases

```bash
cd ~
vim bash.rc
```

- add the line

```bash
alias jn = "jupyter notebook"
```

## 3. Introduction to Python

- This will create a basic python script:


```python
%%writefile hello-world.py
#!/usr/bin/env python
print ("Hello world!")
```

    Overwriting hello-world.py


- now let's make it executable
```bash
!chmod +x hello-world.py
```

- Writing using other character sets

```python
writefile hello-world-in-german.py
#!/usr/bin/env python
# -*- coding: UTF-8 -*-

print(" Meine Völker !")
```

### Importing Packages

- Allows you to import other commands
- The math package has mathematical functions for example

```python
import math
x = math.cos( 2 * math.pi )
```

**OR** for easier reading

```python
from math import cos,pi
x = cos( 2 * pi )
print(x)
```

### Examening Packages

```python
import math
print(dir(math))
```


```python
import math
print(dir(math))
```

    ['__doc__', '__file__', '__name__', '__package__', 'acos', 'acosh', 'asin', 'asinh', 'atan', 'atan2', 'atanh', 'ceil', 'copysign', 'cos', 'cosh', 'degrees', 'e', 'erf', 'erfc', 'exp', 'expm1', 'fabs', 'factorial', 'floor', 'fmod', 'frexp', 'fsum', 'gamma', 'hypot', 'isinf', 'isnan', 'ldexp', 'lgamma', 'log', 'log10', 'log1p', 'modf', 'pi', 'pow', 'radians', 'sin', 'sinh', 'sqrt', 'tan', 'tanh', 'trunc']



```python
import math
help(math.log)
```

    Help on built-in function log in module math:
    
    log(...)
        log(x[, base])
        
        Return the logarithm of x to the given base.
        If the base not specified, returns the natural logarithm (base e) of x.
    


- Some useful pagkages include os, sys, math, and more

### Variables

```python
x = 10.
print (x)
print ( type(x) )
```

- adding a '.' at the end defines it as a float:


```python
x = 10.
print (x)
print ( type(x) )
```

    10.0
    <type 'float'>


#### Variable types

example | type
--- | ---
10. | float
True | bool
10 - 10j | complex



```python
# let's check if a type is what we want
x = 1.0
type(x) is float
```




    True




```python
# we can even save the type as a bool
x = 1.0
typex = type(x) is float
print typex
```

    True



```python
# there is also a function for this
isinstance(x, float)
```




    True



### Type Casting


```python
x = 10.
print (x)
x = int(x)
print (x)
print( list(s))
```

    10.0
    10
    ['H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd']


### Basic Operations

- to the power  \*\*
- division /
- integer division //
- or, and, not, >, <, >=, <=, ==


```python
print (True or False)
print (True and False)
print (not True)
```

    True
    False
    False


- arrays

```python
list1 = [1,2,3,4]
```


### Strings

- just text


```python
s = "Hello World"
print(s)
print( type(s) )
len(s)                                     #length
s2 = s.replace("World" , "Friends")        #replaces strings
print(s2)
print(len(s2))
print(s2[4])                               # counting starts at 0
print(s[0:5])                              # print characters 0-4
print(s[:5])                               # same as above
print(s[5:])                               # 5th till the end
#print(s(5:-1))                             # 5th to second to last
print(s[:])                                # : is all chars
print(s[::2])                              # prints in steps of 2
```

    Hello World
    <type 'str'>
    Hello Friends
    13
    o
    Hello
    Hello
     World
    Hello World
    HloWrd


- **string formatting**

### Lists


```python
# Create a list
l = [1,2,3,4]
type(l)
```




    list




```python
# print certain elements
print (l[2])
print (l[-1])
```

    3
    4


**note: a list is not an array**
- you can put different types of things in there
- you can also nest lists


```python
# look at all the different types inside!
l2 = [1, 2j, "Hello", True]
```

**Range**


```python
print( range(5) )
print( range(4,7) )
print( range(0,20, 4))

```

    [0, 1, 2, 3, 4]
    [4, 5, 6]
    [0, 4, 8, 12, 16]


### More list operations

- Check out this example from https://learnpythonthehardway.org/book/ex38.html



```python
ten_things = "Apples Oranges Crows Telephone Light Sugar"

print "Wait there are not 10 things in that list. Let's fix that."

stuff = ten_things.split(' ')
more_stuff = ["Day", "Night", "Song", "Frisbee", "Corn", "Banana", "Girl", "Boy"]

while len(stuff) != 10:
    next_one = more_stuff.pop()
    print "Adding: ", next_one
    stuff.append(next_one)
    print "There are %d items now." % len(stuff)

print "There we go: ", stuff

print "Let's do some things with stuff."

print stuff[1]
print stuff[-1] # whoa! fancy
print stuff.pop()
print ' '.join(stuff) # what? cool!
print '#'.join(stuff[3:5]) # super stellar!

```

    Wait there are not 10 things in that list. Let's fix that.
    Adding:  Boy
    There are 7 items now.
    Adding:  Girl
    There are 8 items now.
    Adding:  Banana
    There are 9 items now.
    Adding:  Corn
    There are 10 items now.
    There we go:  ['Apples', 'Oranges', 'Crows', 'Telephone', 'Light', 'Sugar', 'Boy', 'Girl', 'Banana', 'Corn']
    Let's do some things with stuff.
    Oranges
    Corn
    Corn
    Apples Oranges Crows Telephone Light Sugar Boy Girl Banana
    Telephone#Light


------

# Lecture 5  — Introduction to Python, pt. 2
### January 11, 2017 (Afternoon)

### Todo list—
1. Tuples
2. Dictionaries
3. Control Flow
4. Loops
5. Functions
6. Classes
7. Modules
8. Try and Accept

## 1. Tuples

- a tuple is a sequence of immutable Python objects. Tuples are sequences, just like lists.
- the differences between tuples and lists are, the tuples cannot be changed unlike lists and tuples use parentheses, whereas lists use square brackets.
- they are like lists, but you can not editable
- use parenthesis

```python
point = (10,20)
```


```python
point = (10,20)
print(point)
```

    (10, 20)



```python
x, y = point
print(x)
print(y)
```

    10
    20


## 2. Dictionaries

- Like lists, but each element is a pair

```python
stuff = {'name': 'Zed', 'age': 39, 'height': 6 * 12 + 2}
```

- see the below example for uses of dictionaries from https://learnpythonthehardway.org/book/ex39.html


```python
states = {
    'Oregon': 'OR',
    'Florida': 'FL',
    'California': 'CA',
    'New York': 'NY',
    'Michigan': 'MI'
}

print(states)

#make a second dictionary

cities = {
    'CA': 'San Francisco',
    'MI': 'Detroit',
    'FL': 'Jacksonville'
}

# add some more cities
cities['NY'] = 'New York'
cities['OR'] = 'Portland'

# print out some cities
print '-' * 10
print "NY State has: ", cities['NY']
print "OR State has: ", cities['OR']

# print some states
print '-' * 10
print "Michigan's abbreviation is: ", states['Michigan']
print "Florida's abbreviation is: ", states['Florida']

# do it by using the state then cities dict
print '-' * 10
print "Michigan has: ", cities[states['Michigan']]
print "Florida has: ", cities[states['Florida']]

# print every state abbreviation
print '-' * 10
for state, abbrev in states.items():
    print "%s is abbreviated %s" % (state, abbrev)

# print every city in state
print '-' * 10
for abbrev, city in cities.items():
    print "%s has the city %s" % (abbrev, city)

# now do both at the same time
print '-' * 10
for state, abbrev in states.items():
    print "%s state is abbreviated %s and has city %s" % (
        state, abbrev, cities[abbrev])

print '-' * 10
# safely get a abbreviation by state that might not be there
state = states.get('Texas')

if not state:
    print "Sorry, no Texas."

# get a city with a default value
city = cities.get('TX', 'Does Not Exist')
print "The city for the state 'TX' is: %s" % city

```

    {'California': 'CA', 'Michigan': 'MI', 'New York': 'NY', 'Florida': 'FL', 'Oregon': 'OR'}
    ----------
    NY State has:  New York
    OR State has:  Portland
    ----------
    Michigan's abbreviation is:  MI
    Florida's abbreviation is:  FL
    ----------
    Michigan has:  Detroit
    Florida has:  Jacksonville
    ----------
    California is abbreviated CA
    Michigan is abbreviated MI
    New York is abbreviated NY
    Florida is abbreviated FL
    Oregon is abbreviated OR
    ----------
    FL has the city Jacksonville
    CA has the city San Francisco
    MI has the city Detroit
    OR has the city Portland
    NY has the city New York
    ----------
    California state is abbreviated CA and has city San Francisco
    Michigan state is abbreviated MI and has city Detroit
    New York state is abbreviated NY and has city New York
    Florida state is abbreviated FL and has city Jacksonville
    Oregon state is abbreviated OR and has city Portland
    ----------
    Sorry, no Texas.
    The city for the state 'TX' is: Does Not Exist


## 3. Control Flow

- **if, elif, else**: the three main conditional words
  - **if** — put first- if x is true, do the following
  - **elif** — if the last thing wasn't true, do this, you can put as many as these as you want
  - **else** — if none of the above stuff was true, do this.  (It's kind of like the last resort.)
- Check out Dario's example below:


```python
#change around statements 1 and 2 from True to False, and see what results you get!

statement1 = True
statement2 = False
if statement1:                     # This is equilvalent to saying "If statement1 is True, do the following"
    print ('Statement 1 is true')
    print ('I am very sorry')
elif statement2 == False:          # This is like saying "if the last thing wasn't true try this instead"
    print ("Nothing")
else:                              # This is like saying "because none of the previous stuff was true, just do this"
    print ("Statement 1 is false")
```

    Statement 1 is true
    I am very sorry


- Check out this fun example from https://learnpythonthehardway.org/book/ex31.html
  - I've added some notes to here


```python
print "You enter a dark room with two doors.  Do you go through door #1 or door #2?"

door = raw_input("> ") #this lets you enter your own text

if door == "1":
    print "There's a giant bear here eating a cheese cake.  What do you do?"
    print "1. Take the cake."
    print "2. Scream at the bear."

    bear = raw_input("> ")

    if bear == "1":
        print "The bear eats your face off.  Good job!"
    elif bear == "2":
        print "The bear eats your legs off.  Good job!"
    else:
        print "Well, doing %s is probably better.  Bear runs away." % bear

elif door == "2":
    print "You stare into the endless abyss at Cthulhu's retina."
    print "1. Blueberries."
    print "2. Yellow jacket clothespins."
    print "3. Understanding revolvers yelling melodies."

    insanity = raw_input("> ")

    if insanity == "1" or insanity == "2":
        print "Your body survives powered by a mind of jello.  Good job!"
    else:
        print "The insanity rots your eyes into a pool of muck.  Good job!"

else:
    print "You stumble around and fall on a knife and die.  Good job!"

```

    You enter a dark room with two doors.  Do you go through door #1 or door #2?
    > 1
    There's a giant bear here eating a cheese cake.  What do you do?
    1. Take the cake.
    2. Scream at the bear.
    > 1
    The bear eats your face off.  Good job!


## 4. Loops

### for loops

- will repeat the same action over and over

```python
for x in [1,2,3]:
    print[x]
    
    1
    2
    3
```


```python
# Here's another example:

for x in range(-3,3):
    print(x)
```

    -3
    -2
    -1
    0
    1
    2



```python
# Here's a simple example from https://learnpythonthehardway.org/book/ex32.html

the_count = [1, 2, 3, 4, 5]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

# this first kind of for-loop goes through a list
for number in the_count:
    print "This is count %d" % number

# same as above
for fruit in fruits:
    print "A fruit of type: %s" % fruit

# also we can go through mixed lists too
# notice we have to use %r since we don't know what's in it
for i in change:
    print "I got %r" % i

# we can also build lists, first start with an empty one
elements = []

# then use the range function to do 0 to 5 counts
for i in range(0, 6):
    print "Adding %d to the list." % i
    # append is a function that lists understand
    elements.append(i)

# now we can print them out too
for i in elements:
    print "Element was: %d" % i
```

    This is count 1
    This is count 2
    This is count 3
    This is count 4
    This is count 5
    A fruit of type: apples
    A fruit of type: oranges
    A fruit of type: pears
    A fruit of type: apricots
    I got 1
    I got 'pennies'
    I got 2
    I got 'dimes'
    I got 3
    I got 'quarters'
    Adding 0 to the list.
    Adding 1 to the list.
    Adding 2 to the list.
    Adding 3 to the list.
    Adding 4 to the list.
    Adding 5 to the list.
    Element was: 0
    Element was: 1
    Element was: 2
    Element was: 3
    Element was: 4
    Element was: 5



```python
# let's make a list of perfect squares
# this is cool because we're doing it all in one line
squares = [x**2 for x in range(0,8)]
print(squares)
```

    [0, 1, 4, 9, 16, 25, 36, 49]


### while loops

- loops something until a condition is satisfied


```python
i = 0

while i < 5:  # as long as i is less than 5, do this thing over and over
    print(i)
    i +=1     # set i to what it was before, but add one
```

    0
    1
    2
    3
    4


## 5. Functions

**Functions do three things:**

- They name pieces of code the way variables name strings and numbers.
- They take arguments the way your scripts take argv.
- Using 1 and 2 they let you make your own "mini-scripts" or "tiny commands."

You can create a function by using the word def in Python. I'm going to have you make four different functions that work like your scripts, and I'll then show you how each one is related.

The simple one below just prints the word "test"


```python
def func0():
    print("test")
    
func0()
```

    test



```python
def func1(s):
    '''this is our second test function
    s is the thing that will print'''
    print ("You wrote "+s)
    
func1("aaa")

help(func1)
```

    You wrote aaa
    Help on function func1 in module __main__:
    
    func1(s)
        this is our second test function
        s is the thing that will print
    



```python
def square(x):
    """Return the square of x"""
    return x ** 2

# we set a to equal our function 
a = square(4)
print(a)
```

    16



```python
def powers(x):
    """Return the first three powers of x"""
    return x ** 2., x ** 3., x ** 4.

# we set a to equal our function 
print(powers(3))

# the following saves the three results from the above function as three separate variables, named p2, p3, and p4
# so now we can use them separately
p2,p3,p4 = powers(3.)
print(p2,p3,p4)
print(p2 + p3 + p4)
```

    (9.0, 27.0, 81.0)
    (9.0, 27.0, 81.0)
    117.0



```python
def myfunc(x, p=2, debug=False):
    if debug:
        print ("I am in debug mode")
        return x ** p
    else:
        print (x ** p)
    
print( myfunc(2,p=2,debug=True))
```

    I am in debug mode
    4


### Lambda functions

- The only advantage of this is the fact that you can use it on one line
- It's used a lot mainy because it's very compact


```python
fl = lambda x: x**2
print (fl(2))
```

    4


## 6. Classes

- Python is called an "object-oriented programming language."
- This means there is a construct in Python called a class that lets you structure your software in a particular way.  - Using classes, you can add consistency to your programs so that they can be used in a cleaner way.
  - At least that's the theory...
  - (https://learnpythonthehardway.org/book/ex40.html)
  
A class has variables, but also some fuctions that act on those variables.  All at the same time.

See Dario's example below:


```python
class Point:
    '''
    Simple class for representing a point in a Cartesian plane
    '''
    def __init__(self, x, y):
        '''
        Create a new point at x, y
        '''
        self.x = x
        self.y = y
    def translate(self, dx, dy):
        '''
        translates a point by dx and 
        '''
        self.x += dx
        self.y += dy
    def __str__(self):
        return("Point at [%f, %f]" % (self.x, self.y))
        
```


```python
pt = Point(0,0)
print(pt)

pt.translate(1,-1)
print(pt)
```

    Point at [0.000000, 0.000000]
    Point at [1.000000, -1.000000]


## 7. Modules

- Modules are like dictionaries
- You know how a dictionary is created and used and that it is a way to map one thing to another. That means if you have a dictionary with a key "apple" and you want to get it then you do this:

```python
mystuff = {'apple': "I AM APPLES!"}
print mystuff['apple']
```

Keep this idea of "get X from Y" in your head, and now think about modules. You've made a few so far, and you should know they are:

1. A Python file with some functions or variables in it ..
2. You import that file.
3. And you can access the functions or variables in that module with the . (dot) operator.


```python
# this goes in mystuff.py
def apple():
    print "I AM APPLES!"

# this is just a variable
tangerine = "Living reflection of a dream"
```

## 8. Try and Except

In Python errors are managed with a special language construct called "Exceptions". When errors occur exceptions can be raised, which interrupts the normal program flow and fallback to somewhere else in the code where the closest try-except statement is defined.
To generate an exception we can use the raise statement, which takes an argument that must be an instance of the class BaseException or a class derived from it. 


```python
"""test = "Nuclear test"

try:
    print('test')
    # generates an error: the variable test is not defined
    #etc
    
    """
```


      File "<ipython-input-1-d31d321c142f>", line 8
        
        ^
    SyntaxError: invalid syntax



Ok to be honest I have no idea what the above is... oh well

## 9. Plotting

**See this guide for Dario's full tutorial on plotting with mathplotlib:            
https://github.com/darioflute/CS4A/blob/master/Lecture-plotting.ipynb**

- type the following line at the beginning
- this is so that plots will show up inside Jupyter, I don't think you need it in your code

```python
%matplotlib inline
```

### Basic Plotting

- when Dario adds his notes for plotting I will paste it here
- the following command will import the module and name it plt


```python
%matplotlib inline
import matplotlib.pyplot as plt
# numerical python = numpy
import numpy as np
```


```python
x = np.arange(0,1,0.1)
y = x**2
plt.plot(x,y)
```




    [<matplotlib.lines.Line2D at 0x10cbff290>]



    /Users/jarredgreen/anaconda/lib/python2.7/site-packages/matplotlib/font_manager.py:273: UserWarning: Matplotlib is building the font cache using fc-list. This may take a moment.
      warnings.warn('Matplotlib is building the font cache using fc-list. This may take a moment.')



![png](output_167_2.png)



```python
#error bars example
yerr = np.ones(x.size)*0.1 #ones creates an array of 1's
plt.errorbar(x,y,yerr=yerr)
plt.show()
```


![png](output_168_0.png)


### See this link for more documentation
- intro http://matplotlib.org/users/pyplot_tutorial.html
- full beginners guide http://matplotlib.org/users/beginner.html
- all documentations for matplotlib http://matplotlib.org/contents.html


```python
#3D plotting documents
from mpl_toolkits.mplot3d.axes3d import Axes3D
```

-------

# Lecture 6 — GUI Programming and Widgets
### January 12, 2017 (Morning)

Todo
1. Install wxpython
2. Our first application: "Hello, World"
3. A simple text editor
4. Status bars & Menu bars
5. Event Handling
6. Buttons


wxpython is basically just a python package that lets you make little windows and applications.
there are many other packages that do the same thing
Check them all out here! https://wiki.python.org/moin/GuiProgramming

## 1. Install wxpython

**This is quite confusing, and if you are curious to read more about this wxpython widget package check out the official documentation at https://wiki.wxpython.org/Getting%20Started**

- To make a graphical interface to use a code in an interactive way we need a library of widgets, called wxpython.  We will explore the usage of this library mainly with examples.  But to start we have to install it with conda.

- run the following command:

```bash
conda install wxpython
```

## 2. Our first application

A traditional "Hello, World" application


```python
%%writefile framecode.py
#!/usr/bin/env pythonw                            #!/usr/bin/env python on linux
import wx

app = wx.App(False)                               #create a new app, don't redirect stdout/stderr to
frame = wx.Frame(None, wx.ID_ANY, "Hello World")  # A frame is the top-level
frame.Show(True)                                  #Show the frame
app.MainLoop()
```

    Overwriting framecode.py



```python
!pythonw framecode.py                             #!python framecode.py on linux
```

## 3. wx.TextCtrl widget  — A simple text editor

This little app will let you type some text into a box.  Cool!!


```python
%%writefile editor.py
#!/usr/bin/env pythonw
import wx
class MyFrame(wx.Frame):
        """We simply derive a new class of frame"""
        def __init__(self, parent, title):
            wx.Frame.__init__(self, parent, title=title, size=(200,100))
            self.control = wx.TextCtrl(self, style=wx.TE_MULTILINE)
            self.Show(True)
            
app = wx.App(False)
frame = MyFrame(None, 'Small editor')
app.MainLoop()
```


```python
!pythonw editor.py
```

## 4. Status bars & Menu bars


```python
%%writefile MainWindow.py
#!/usr/bin/env pythonw
import wx
class MyFrame(wx.Frame):
        """We simply derive a new class of frame"""
        def __init__(self, parent, title):
            wx.Frame.__init__(self, parent, title=title, size=(200,100))
            self.control = wx.TextCtrl(self, style=wx.TE_MULTILINE)
            self.CreateStatusBar() #A statusbar at the bottom of the window
            
            # setting up the menu.
            filemenu= wx.Menu()
            
            # wx.ID_ABOUT and wx.ID_EXIT are standard IDs provided by wxWidgets
            filemenu.Append(wx.ID_ABOUT, "&About"," Information about this program")
            filemenu.AppendSeparator()
            filemenu.Append(wx.ID_EDIT, "&Exit"," Terminate the program")
            
            # Creating the menubar
            menuBar = wx.MenuBar()
            menuBar.Append(filemenu, "&File") # adding the "filename" to the...
            self.SetMenuBar(menuBar) # Adding the MenuBar for the Frame content
            self.Show(True)
            
app = wx.App(False)
frame = MyFrame(None, 'Sample editor')
app.MainLoop()
```

    Overwriting MainWindow.py



```python
!pythonw MainWindow.py
```

## 5. Event Handling

- Reacting to evens in wxPython is called event handling.
- And event is when "something happens in your application
  - eg button click, text input, mouse movement, etc)
  - Much of GUI programming consists of responding to events
  
Cope same code as  


```python
%%writefile MenuActions.py
#!/usr/bin/env pythonw
import wx
class MyFrame(wx.Frame):
        """We simply derive a new class of frame"""
        def __init__(self, parent, title):
            wx.Frame.__init__(self, parent, title=title, size=(200,100))
            self.control = wx.TextCtrl(self, style=wx.TE_MULTILINE)
            self.CreateStatusBar() #A statusbar at the bottom of the window
            
            # setting up the menu.
            filemenu= wx.Menu()
            
            # wx.ID_ABOUT and wx.ID_EXIT are standard IDs provided by wxWidgets
            # give names to the following things
            menuAbout = filemenu.Append(wx.ID_ABOUT, "&About"," Information about this program")
            filemenu.AppendSeparator()
            menuExit = filemenu.Append(wx.ID_EDIT, "&Exit"," Terminate the program")
            
            # Creating the menubar
            menuBar = wx.MenuBar()
            menuBar.Append(filemenu, "&File") # adding the "filename" to the...
            self.SetMenuBar(menuBar) # Adding the MenuBar for the Frame content
            
            #New code beings here:
            #set events:
            self.Bind(wx.EVT_MENU, self.OnAbout, menuAbout)
            self.Bind(wx.EVT_MENU, self.OnExit, menuExit)
            self.Show(True)
            
        #add our new functions:
        
        def OnAbout(self,e):
            # A message dialog box with an OK button, wx.OK is a standard ID
            dlg = wx.MessageDialog( self, "I'm sorry.  sorry.  let's get burritos", "Actually Dominic, I KNEW IT", wx.OK)
            dlg.ShowModal() #show it
            dlg.Destroy() # destroy it when finished
        
        def OnExit(self,e):
            self.Close(True) # close the frame
            
app = wx.App(False)
frame = MyFrame(None, 'Sample editor')
app.MainLoop()
```

    Overwriting MenuActions.py



```python
!pythonw MenuActions.py

# Try going to the menu -> about
# Try going to file -> Quit
```

### Now add an open command


```python
%%writefile MenuActionsOpen.py
#!/usr/bin/env pythonw
import wx
import os
class MyFrame(wx.Frame):
        """We simply derive a new class of frame"""
        def __init__(self, parent, title):
            wx.Frame.__init__(self, parent, title=title, size=(200,100))
            self.control = wx.TextCtrl(self, style=wx.TE_MULTILINE)
            self.CreateStatusBar() #A statusbar at the bottom of the window
            
            # setting up the menu.
            filemenu= wx.Menu()
            
            # wx.ID_ABOUT and wx.ID_EXIT are standard IDs provided by wxWidgets
            # give names to the following things
            menuOpen = filemenu.Append(wx.ID_OPEN, "&Open", " Open text file")  ###NEW
            menuAbout = filemenu.Append(wx.ID_ABOUT, "&About"," Information about this program")
            filemenu.AppendSeparator()
            menuExit = filemenu.Append(wx.ID_EDIT, "&Exit"," Terminate the program")
            
            # Creating the menubar
            menuBar = wx.MenuBar()
            menuBar.Append(filemenu, "&File") # adding the "filename" to the...
            self.SetMenuBar(menuBar) # Adding the MenuBar for the Frame content
            
            #New code beings here:
            #set events:
            self.Bind(wx.EVT_MENU, self.OnOpen, menuOpen)  ###New
            self.Bind(wx.EVT_MENU, self.OnAbout, menuAbout)
            self.Bind(wx.EVT_MENU, self.OnExit, menuExit)
            self.Show(True)
            
        #add our new functions:
        
        def OnAbout(self,e):
            # A message dialog box with an OK button, wx.OK is a standard ID
            dlg = wx.MessageDialog( self, "I'm sorry.  sorry.  let's get burritos", "Actually Dominic, I KNEW IT", wx.OK)
            dlg.ShowModal() #show it
            dlg.Destroy() # destroy it when finished
        
        def OnExit(self,e):
            self.Close(True) # close the frame
            
        def OnOpen(self,e):  ###NEW
            """Open a file"""
            self.dirname = ''
            dlg = wx.FileDialog(self, "Choose a file", self.dirname, "", "*.*", wx.OPEN)
            if dlg.ShowModal() == wx.ID_OK:
                self.filename = dlg.GetFilename()
                self.dirname = dlg.GetDirectory()
                f = open(os.path.join(self.dirname, self.filename), 'r')
                self.control.SetValue(f.read())
                f.close()
            dlg.Destroy()
            
app = wx.App(False)
frame = MyFrame(None, 'Sample editor')
app.MainLoop()
```

    Overwriting MenuActionsOpen.py



```python
!pythonw MenuActionsOpen.py
```

^ try adding a plain text file from the open menu!
cool!

## 6. Buttons


```python
%%writefile MenuButtons.py
#!/usr/bin/env pythonw
import wx
import os
class MyFrame(wx.Frame):
        """We simply derive a new class of frame"""
        def __init__(self, parent, title):
            wx.Frame.__init__(self, parent, title=title, size=(500,500))
            self.control = wx.TextCtrl(self, style=wx.TE_MULTILINE)
            self.CreateStatusBar() #A statusbar at the bottom of the window
            
            # setting up the menu.
            filemenu= wx.Menu()
            
            # wx.ID_ABOUT and wx.ID_EXIT are standard IDs provided by wxWidgets
            # give names to the following things
            menuOpen = filemenu.Append(wx.ID_OPEN, "&Open", " Open text file")
            menuAbout = filemenu.Append(wx.ID_ABOUT, "&About"," Information about this program")
            filemenu.AppendSeparator()
            menuExit = filemenu.Append(wx.ID_EDIT, "&Exit"," Terminate the program")
            
            # Creating the menubar
            menuBar = wx.MenuBar()
            menuBar.Append(filemenu, "&File") # adding the "filename" to the...
            self.SetMenuBar(menuBar) # Adding the MenuBar for the Frame content
        
            #set events:
            self.Bind(wx.EVT_MENU, self.OnOpen, menuOpen)
            self.Bind(wx.EVT_MENU, self.OnAbout, menuAbout)
            self.Bind(wx.EVT_MENU, self.OnExit, menuExit)
            
            # New code here:
            
            self.sizer2 = wx.BoxSizer(wx.HORIZONTAL) # stack the buttons in a horizontal way
            self.buttons = []
            for i in range(0,6):  # this command adds the buttons
                self.buttons.append(wx.Button(self, -1, "Button &"+str(i)))
                self.sizer2.Add(self.buttons[i], 1, wx.EXPAND) 
            
            #use some sizers to see layout options
            self.sizer = wx.BoxSizer(wx.VERTICAL) # stack the text box and the button box vertically
            self.sizer.Add(self.control, 1, wx.EXPAND) # the text editor
            self.sizer.Add(self.sizer2, 0, wx.EXPAND) # the box where the buttons go
            
            #Layout sizers
            self.SetSizer(self.sizer)
            self.SetAutoLayout(1)
            self.sizer.Fit(self)
            self.Show(True)
        
        def OnAbout(self,e):
            # A message dialog box with an OK button, wx.OK is a standard ID
            dlg = wx.MessageDialog( self, "I'm sorry.  sorry.  let's get burritos", "Actually Dominic, I KNEW IT", wx.OK)
            dlg.ShowModal() #show it
            dlg.Destroy() # destroy it when finished
        
        def OnExit(self,e):
            self.Close(True) # close the frame
            
        def OnOpen(self,e):  ###NEW
            """Open a file"""
            self.dirname = ''
            dlg = wx.FileDialog(self, "Choose a file", self.dirname, "", "*.*", wx.OPEN)
            if dlg.ShowModal() == wx.ID_OK:
                self.filename = dlg.GetFilename()
                self.dirname = dlg.GetDirectory()
                f = open(os.path.join(self.dirname, self.filename), 'r')
                self.control.SetValue(f.read())
                f.close()
            dlg.Destroy()
            
app = wx.App(False)
frame = MyFrame(None, 'Sample editor')
app.MainLoop()
```

    Overwriting MenuButtons.py



```python
!pythonw MenuButtons.py
```

^ try changing the HORIZONTALs to VERTICALs and seeing what happens :)

------

# Lecture 7 — More Widgets
### January 13, 2017 (Morning)

Todo
1. A multi-featured widget
2. Notebook Demo
3. Adding a grid

## 1. A multi-featured widget


```python
%%writefile example.py
import wx
import os
class ExamplePanel (wx.Panel):
    def __init__(self, parent):
        wx.Panel.__init__(self,parent)
        self.quote= wx.StaticText(self, label="Your Quote :", pos=(20,30))
        self.logger = wx.TextCtrl(self, pos=(320,20), size=(200,300), style=wx.TE_MULTILINE | wx.TE_READONLY)

        # A button
        self.button = wx.Button(self, label="Save", pos=(200, 325))
        self.Bind(wx.EVT_BUTTON, self.OnClick,self.button)

        # the edit control - one line version
        self.lblname = wx.StaticText(self, label="Your name :", pos=(20,60))
        self.editname = wx.TextCtrl(self, value="Enter here your name", pos=(150,60), size=(140,-1))
        self.Bind(wx.EVT_TEXT,self.EvtText,self.editname)
        self.Bind(wx.EVT_CHAR,self.EvtChar,self.editname)

        # the combobox Control
        self.sampleList = ['friends', 'advertising', 'web search', 'Yellow Pages']
        self.lblhear = wx.StaticText(self, label="How did you hear from us?", pos=(20,90))
        self.edithear = wx.ComboBox(self, pos=(197,88),size=(95,-1),choices=self.sampleList, style=wx.CB_DROPDOWN)
        self.Bind(wx.EVT_COMBOBOX,self.EvtComboBox,self.edithear)
        self.Bind(wx.EVT_TEXT,self.EvtText,self.edithear)

        self.insure=wx.CheckBox(self,label="Do you want Insured Shipment?", pos=(20,180))
        self.Bind(wx.EVT_CHECKBOX,self.EvtCheckBox,self.insure)

        # Radio Boxes
        radioList = ['blue','red','yellow','orange','green','purple','navy blue','black','gray']
        rb = wx.RadioBox(self,label="What color whould you like?", pos=(20,210), choices=radioList, majorDimension=3,style=wx.RA_SPECIFY_COLS)
        self.Bind(wx.EVT_RADIOBOX,self.EvtRadioBox,rb)
    
    def EvtRadioBox(self,event):
        self.logger.AppendText('EvtRadioBox: %d\n' % event.GetInt())
    def EvtComboBox(self,event):
        self.logger.AppendText('EvtComboBox %s/n' % event.GetString())
    def OnClick(self,event):
        self.logger.AppendText('Click on an object with ID %d\n' % event.GetId())
    def EvtText(self,event):
        self.logger.AppendText('EvtText: %s\n' % event.GetString())
    def EvtChar(self,event):
        self.logger.AppendText('EvtChar: %d\n' % event.GetKeyCode())
    def EvtCheckBox(self,event):
        self.logger.AppendText('EvtCheckBox: %d\n' % event.Checked())
```

    Overwriting example.py



```python
%%writefile control_demo.py
import wx
from example import ExamplePanel

app = wx.App(False)
frame = wx.Frame(None,size=(550,400))
panel = ExamplePanel(frame)
frame.Show()
app.MainLoop()
```

    Overwriting control_demo.py



```python
!pythonw control_demo.py
```

## 2. Notebook Demo


```python
%%writefile notebook_demo.py
import wx
from example import ExamplePanel

app = wx.App(False)
frame = wx.Frame(None, title="Demo with Notebook", size=(600,500))
nb = wx.Notebook(frame)

nb.AddPage(ExamplePanel(nb), "Absolute Positioning")
nb.AddPage(ExamplePanel(nb), "Page Two")
nb.AddPage(ExamplePanel(nb), "Page Three")
frame.Show()
app.MainLoop()
```

    Overwriting notebook_demo.py



```python
!pythonw notebook_demo.py
```

## 3. Adding a grid
- we will add a grid so all the things line up nicely


```python
%%writefile example.py
import wx
import os
class ExamplePanel (wx.Panel):
    def __init__(self, parent):
        wx.Panel.__init__(self,parent)
        
        # create some sizers
        # NEW CODE:
        mainSizer = wx.BoxSizer(wx.VERTICAL)
        grid = wx. GridBagSizer(hgap=5, vgap=5)
        hSizer = wx.BoxSizer(wx.HORIZONTAL)
        
        self.quote= wx.StaticText(self, label="Your Quote :")
        grid.Add(self.quote, pos=(0,0))  #NEW LINE
        
        # A multiline textctrl - this is here to show how the events work
        self.logger = wx.TextCtrl(self, size=(200,300), style=wx.TE_MULTILINE | wx.TE_READONLY)

        # A button
        self.button = wx.Button(self, label="Save")
        grid.Add(self.button, pos=(0,1))
        self.Bind(wx.EVT_BUTTON, self.OnClick,self.button)

        # the edit control - one line version
        self.lblname = wx.StaticText(self, label="Your name :")
        grid.Add(self.lblname, pos=(1,0))
        self.editname = wx.TextCtrl(self, value="Enter here your name", size=(140,-1))
        grid.Add(self.editname, pos=(1,1))
        self.Bind(wx.EVT_TEXT,self.EvtText,self.editname)
        self.Bind(wx.EVT_CHAR,self.EvtChar,self.editname)

        # the combobox Control
        self.sampleList = ['friends', 'advertising', 'web search', 'Yellow Pages']
        self.lblhear = wx.StaticText(self, label="How did you hear from us?")
        grid.Add(self.lblhear, pos=(3,0))
        self.edithear = wx.ComboBox(self, size=(95,-1),choices=self.sampleList, style=wx.CB_DROPDOWN)
        grid.Add(self.edithear, pos=(3,1))
        self.Bind(wx.EVT_COMBOBOX,self.EvtComboBox,self.edithear)
        self.Bind(wx.EVT_TEXT,self.EvtText,self.edithear)
        
        # add a spacer to the sizer
        grid.Add((10,40), pos=(2,0))   # NEW LINE

        # check box
        self.insure=wx.CheckBox(self,label="Do you want Insured Shipment?")
        grid.Add(self.insure, pos=(4,0), span=(1,2), flag=wx.BOTTOM, border=5) # NEW LINE
        self.Bind(wx.EVT_CHECKBOX,self.EvtCheckBox,self.insure)

        # Radio Boxes
        radioList = ['blue','red','yellow','orange','green','purple','navy blue','black','gray']
        rb = wx.RadioBox(self,label="What color whould you like?", choices=radioList, majorDimension=3,style=wx.RA_SPECIFY_COLS)
        grid.Add(rb, pos=(5,0), span=(1,2)) #NEW LINE
        self.Bind(wx.EVT_RADIOBOX,self.EvtRadioBox,rb)
        
        # NEW CODE
        hSizer.Add(grid, 0, wx.ALL, 5)
        hSizer.Add(self.logger)
        mainSizer.Add(hSizer, 0, wx.ALL, 5)
        mainSizer.Add(self.button, 0 , wx.CENTER)
        self.SetSizerAndFit(mainSizer)
        
    
    def EvtRadioBox(self,event):
        self.logger.AppendText('EvtRadioBox: %d\n' % event.GetInt())
    def EvtComboBox(self,event):
        self.logger.AppendText('EvtComboBox %s/n' % event.GetString())
    def OnClick(self,event):
        self.logger.AppendText('Click on an object with ID %d\n' % event.GetId())
    def EvtText(self,event):
        self.logger.AppendText('EvtText: %s\n' % event.GetString())
    def EvtChar(self,event):
        self.logger.AppendText('EvtChar: %d\n' % event.GetKeyCode())
    def EvtCheckBox(self,event):
        self.logger.AppendText('EvtCheckBox: %d\n' % event.Checked())
```

    Overwriting example.py



```python
!pythonw control_demo.py
```

## 4. Adding images



```python
%%writefile mpl_demo.py
#!/usr/bin/env python
#import wxversion
#wxversion.ensureMinimal('2.8')

from numpy import arange, sin, pi
from matplotlib.backends.backend_wxagg import FigureCanvasWxAgg as FigureCanvas
from matplotlib.figure import Figure
import wx

class CanvasFrame(wx.Frame):
    def __init__(self):
        wx.Frame.__init__(self, None, -1,
                          'CanvasFrame', size=(550, 350))

        self.figure = Figure()
        self.axes = self.figure.add_subplot(111)
        t = arange(0.0, 3.0, 0.01)
        s = sin(2 * pi * t)

        self.axes.plot(t, s)
        self.canvas = FigureCanvas(self, -1, self.figure)

        self.sizer = wx.BoxSizer(wx.VERTICAL)
        self.sizer.Add(self.canvas, 1, wx.LEFT | wx.TOP | wx.EXPAND)
        self.SetSizer(self.sizer)
        self.Fit()

class App(wx.App):
    def OnInit(self):
        'Create the main window and insert the custom frame'
        frame = CanvasFrame()
        frame.Show(True)
        return True

app = App(0)
app.MainLoop()
```

    Overwriting mpl_demo.py



```python
!pythonw mpl_demo.py
```

-------

# Lecture 8 — Intro to astropy
### January 16, 2017 (Morning)

Todo
1. setup
2. intro to FITS Files
3. opening FITS files in a more general way
4. coordinate transformations
5. cutouts
6. saving a FITS files
7. tables in astropy
8. making a table
9. astronomical units
10. astronomical constants
11. astronomical query
12. histograms

## 1. Setup

**Note: Dario's notes for this lecture**

**http://localhost:8888/notebooks/CS4A/Lecture-astronomy.ipynb**

```bash
conda install astropy
conda install -c astropy astroquery
```

## 2. Intro to FITS  files

- Allows you to store images, even those in several dimensions, as binary files.
- Very popular for astronmy
- Images from a telescope
- The Vatican library is storing its images as FITS files (haha!)
    - Remember when the Vatican hated astronomers?  #TBT
    
### Reading a FITS file
use:
```python
from astronomy.io import fits
```

run the command below to import an example FITS file


```python
from astropy.utils.data import download_file
from astropy.io import fits

image_file = download_file('https://astropy.stsci.edu/data/tutorials/FITS-images/HorseHead.fits', cache=True)
```


```python
fits.info(image_file)
```

    Filename: /Users/jarredgreen/.astropy/cache/download/py2/2c9202ae878ecfcb60878ceb63837f5f
    No.    Name         Type      Cards   Dimensions   Format
      0  PRIMARY     PrimaryHDU     161   (891, 893)   int16   
      1  er.mask     TableHDU        25   1600R x 4C   [F6.2, F6.2, F6.2, F6.2]   



```python
#check its shape:
image_data = fits.getdata(image_file, ext=0)
image_data.shape
```




    (893, 891)




```python
import matplotlib.pyplot as plt
%matplotlib inline

plt.figure()
plt.imshow(image_data, cmap='gist_heat', origin='lower')
plt.colorbar();
```


![png](output_212_0.png)


## 3. Opening FITS in a more general way


```python
hdulist = fits.open(image_file)
hdulist.info()
```

    Filename: /Users/jarredgreen/.astropy/cache/download/py2/2c9202ae878ecfcb60878ceb63837f5f
    No.    Name         Type      Cards   Dimensions   Format
      0  PRIMARY     PrimaryHDU     161   (891, 893)   int16   
      1  er.mask     TableHDU        25   1600R x 4C   [F6.2, F6.2, F6.2, F6.2]   



```python
header = hdulist['PRIMARY'].header
data = hdulist['PRIMARY'].data
```


```python
# to clear the item from your memory
hdulist.close
```




    <bound method HDUList.close of [<astropy.io.fits.hdu.image.PrimaryHDU object at 0x111c56dd0>, <astropy.io.fits.hdu.table.TableHDU object at 0x111cc14d0>]>




```python
# Now let's explore the header
print(repr(header[:10]))  # beginning of the header
```

    SIMPLE  =                    T /FITS: Compliance                                
    BITPIX  =                   16 /FITS: I*2 Data                                  
    NAXIS   =                    2 /FITS: 2-D Image Data                            
    NAXIS1  =                  891 /FITS: X Dimension                               
    NAXIS2  =                  893 /FITS: Y Dimension                               
    EXTEND  =                    T /FITS: File can contain extensions               
    DATE    = '2014-01-09        '  /FITS: Creation Date                            
    ORIGIN  = 'STScI/MAST'         /GSSS: STScI Digitized Sky Survey                
    SURVEY  = 'SERC-ER '           /GSSS: Sky Survey                                
    REGION  = 'ER768   '           /GSSS: Region Name                               



```python
# how to see the coordinates on the sky

from astropy.wcs import WCS
wcs = WCS(header)
print wcs
```

    WCS Keywords
    
    Number of WCS axes: 2
    CTYPE : 'RA---TAN'  'DEC--TAN'  
    CRVAL : 85.599416666666656  -4.9466388888888888  
    CRPIX : -716.333144294269  -8444.6494669822605  
    PC1_1 PC1_2  : 0.015029018460682027  -9.6373577765719806e-06  
    PC2_1 PC2_2  : 1.0548917307845708e-05  0.015000473845055023  
    CDELT : -0.018654788242111486  0.018654788242111486  
    NAXIS : 891  893



```python
# now let's actually plot the figure with coordinates

# FINISH these notes
fig = plt.figure()
ax = fig.add_axes([0.1, 0.1, 0.8, 0.8], projection=wcs)
ax.set_xlabel('RA')
ax.set_ylabel('Dec')
ax.imshow(data, cmap='gist_heat',origin='lower')
ra = ax.coords[0]
ra.set_major_formatter('hh:mm:ss')
dec = ax.coords[1]
dec.set_major_formatter('dd:mm:ss')
```


![png](output_219_0.png)


## 4. Coordinate transformations


```python
# now let's compute the coordinates of the center of the horse head:

from astropy.coordinates import SkyCoord
c0 = SkyCoord('5h41m00s','-2d27m00s',frame='icrs')
print c0
```

    <SkyCoord (ICRS): (ra, dec) in deg
        ( 85.25, -2.45)>


### From pixel coordinates and vice versa


```python
# from pixel -> world

# from world -> pixel
```


```python
# e.g.

center = wcs.all_world2pix(c0.ra,c0.dec,0)
print (center)
```

    [array(534.1235215073059), array(475.55046970355943)]


## 5. Cutouts

- what to do when you only need a part of the image
- here we use the class Cutout2D


```python
from astropy.nddata import Cutout2D
size = 400
cutout = Cutout2D(data, center, size, wcs=wcs)

print cutout.bbox_original
```

    ((276, 675), (334, 733))



```python
fig = plt.figure()
ax = fig.add_axes([0.1,0.1,0.8,0.8], projection=cutout.wcs)
ax.set_xlabel('RA')
ax.set_ylabel('Dec')
ax.imshow(cutout.data, cmap='gist_heat', origin='lower')
ra = ax.coords[0]
ra.set_major_formatter('hh:mm:ss')
dec = ax.coords[1]
dec.set_major_formatter('dd:mm:ss');
```


![png](output_227_0.png)


## 6. Saving a new FITS file


```python
# Making a Primary HDU
# finish this...
```


```python
# the overwrite = True allows us to rewrite over the old file

cheader = cutout.wcs.to_header()
primaryhdu = fits.PrimaryHDU(cutout.data, cheader)
hdulist = fits.HDUList([primaryhdu])
hdulist.writeto('horse.fits', overwrite=True)
```

## 7. Tables in astropy

- You can also use the FITS interface to open tables

```python
from astropy.table import Table
#getting the first table
t1 = Table.read(filename.fits)
```

- if you go back and look at the log for the horsehead file, yo ucan see that we also have a table in extension 1


```python
from astropy.table import Table
t = Table.read(image_file, hdu=1)
t[:10].show_in_notebook()
```

    WARNING: UnitsWarning: 'DEGREES' did not parse as fits unit: At col 0, Unit 'DEGREES' not supported by the FITS standard.  [astropy.units.core]
    WARNING: UnitsWarning: 'ARCSEC' did not parse as fits unit: At col 0, Unit 'ARCSEC' not supported by the FITS standard. Did you mean arcsec? [astropy.units.core]





&lt;Table length=10&gt;
<table id="table4593769168-113304" class="table-striped table-bordered table-condensed">
<thead><tr><th>idx</th><th>XI</th><th>ETA</th><th>XI_CORR</th><th>ETA_CORR</th></tr></thead>
<thead><tr><th></th><th>DEGREES</th><th>DEGREES</th><th>ARCSEC</th><th>ARCSEC</th></tr></thead>
<tr><td>0</td><td>-3.12</td><td>-3.12</td><td>0.09</td><td>0.04</td></tr>
<tr><td>1</td><td>-2.96</td><td>-3.12</td><td>0.02</td><td>0.07</td></tr>
<tr><td>2</td><td>-2.8</td><td>-3.12</td><td>-0.07</td><td>0.15</td></tr>
<tr><td>3</td><td>-2.64</td><td>-3.12</td><td>-0.17</td><td>0.25</td></tr>
<tr><td>4</td><td>-2.48</td><td>-3.12</td><td>-0.29</td><td>0.26</td></tr>
<tr><td>5</td><td>-2.32</td><td>-3.12</td><td>-0.38</td><td>0.25</td></tr>
<tr><td>6</td><td>-2.16</td><td>-3.12</td><td>-0.42</td><td>0.15</td></tr>
<tr><td>7</td><td>-2.0</td><td>-3.12</td><td>-0.48</td><td>0.06</td></tr>
<tr><td>8</td><td>-1.84</td><td>-3.12</td><td>-0.47</td><td>-0.01</td></tr>
<tr><td>9</td><td>-1.68</td><td>-3.12</td><td>-0.47</td><td>-0.12</td></tr>
</table><style>table.dataTable {clear: both; width: auto !important; margin: 0 !important;}
.dataTables_info, .dataTables_length, .dataTables_filter, .dataTables_paginate{
display: inline-block; margin-right: 1em; }
.paginate_button { margin-right: 5px; }
</style>
<script>
require.config({paths: {
    datatables: 'https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min'
}});
require(["datatables"], function(){
    console.log("$('#table4593769168-113304').dataTable()");
    $('#table4593769168-113304').dataTable({
        "order": [],
        "iDisplayLength": 50,
        "aLengthMenu": [[10, 25, 50, 100, 500, 1000, -1], [10, 25, 50, 100, 500, 1000, 'All']],
        "pagingType": "full_numbers"
    });
});
</script>





```python
# you can also just print the table

from astropy.table import Table
t = Table.read(image_file, hdu=1)
print(t[:10])
```

       XI     ETA   XI_CORR ETA_CORR
    DEGREES DEGREES  ARCSEC  ARCSEC 
    ------- ------- ------- --------
      -3.12   -3.12    0.09     0.04
      -2.96   -3.12    0.02     0.07
       -2.8   -3.12   -0.07     0.15
      -2.64   -3.12   -0.17     0.25
      -2.48   -3.12   -0.29     0.26
      -2.32   -3.12   -0.38     0.25
      -2.16   -3.12   -0.42     0.15
       -2.0   -3.12   -0.48     0.06
      -1.84   -3.12   -0.47    -0.01
      -1.68   -3.12   -0.47    -0.12


- a table is bot ha dictionary and numpy arry like datatype that can be acceped by a key (for columns) or index (for rows)
- this can be useful if you have a table with many colums and you only need a few


```python
# e.g.
import numpy as np
print t[np.where(t['ETA_CORR'] > 0.8)]
```

       XI     ETA   XI_CORR ETA_CORR
    DEGREES DEGREES  ARCSEC  ARCSEC 
    ------- ------- ------- --------
      -0.24    2.96   -0.11     0.81
      -0.08    2.96   -0.06     0.86
       0.08    2.96    0.05     0.88
       0.24    2.96    0.13     0.82
      -0.24    3.12   -0.12     0.85
      -0.08    3.12   -0.07      0.9
       0.08    3.12    0.07     0.91
       0.24    3.12     0.2      0.9
        0.4    3.12    0.23     0.83


## 8. Making a table

-- see his example --


```python
import numpy as np
a = np.arange(0,10,0.1)
b = a**2
t1 = Table([a,b], names=('a','b'))

plt.plot(t1['a'],t1['b']);

```


![png](output_237_0.png)


### Saving your table


```python
t1.write('table.txt',format='ascii.tab')
```

    WARNING: AstropyDeprecationWarning: table.txt already exists. Automatically overwriting ASCII files is deprecated. Use the argument 'overwrite=True' in the future. [astropy.io.ascii.ui]



```python
!cat table.txt
```

    a	b
    0.0	0.0
    0.1	0.010000000000000002
    0.2	0.04000000000000001
    0.30000000000000004	0.09000000000000002
    0.4	0.16000000000000003
    0.5	0.25
    0.6000000000000001	0.3600000000000001
    0.7000000000000001	0.4900000000000001
    0.8	0.6400000000000001
    0.9	0.81
    1.0	1.0
    1.1	1.2100000000000002
    1.2000000000000002	1.4400000000000004
    1.3	1.6900000000000002
    1.4000000000000001	1.9600000000000004
    1.5	2.25
    1.6	2.5600000000000005
    1.7000000000000002	2.8900000000000006
    1.8	3.24
    1.9000000000000001	3.6100000000000003
    2.0	4.0
    2.1	4.41
    2.2	4.840000000000001
    2.3000000000000003	5.290000000000001
    2.4000000000000004	5.760000000000002
    2.5	6.25
    2.6	6.760000000000001
    2.7	7.290000000000001
    2.8000000000000003	7.840000000000002
    2.9000000000000004	8.410000000000002
    3.0	9.0
    3.1	9.610000000000001
    3.2	10.240000000000002
    3.3000000000000003	10.890000000000002
    3.4000000000000004	11.560000000000002
    3.5	12.25
    3.6	12.96
    3.7	13.690000000000001
    3.8000000000000003	14.440000000000001
    3.9000000000000004	15.210000000000003
    4.0	16.0
    4.1000000000000005	16.810000000000006
    4.2	17.64
    4.3	18.49
    4.4	19.360000000000003
    4.5	20.25
    4.6000000000000005	21.160000000000004
    4.7	22.090000000000003
    4.800000000000001	23.040000000000006
    4.9	24.010000000000005
    5.0	25.0
    5.1000000000000005	26.010000000000005
    5.2	27.040000000000003
    5.300000000000001	28.090000000000007
    5.4	29.160000000000004
    5.5	30.25
    5.6000000000000005	31.360000000000007
    5.7	32.49
    5.800000000000001	33.64000000000001
    5.9	34.81
    6.0	36.0
    6.1000000000000005	37.21000000000001
    6.2	38.440000000000005
    6.300000000000001	39.69000000000001
    6.4	40.96000000000001
    6.5	42.25
    6.6000000000000005	43.56000000000001
    6.7	44.89
    6.800000000000001	46.24000000000001
    6.9	47.61000000000001
    7.0	49.0
    7.1000000000000005	50.41000000000001
    7.2	51.84
    7.300000000000001	53.29000000000001
    7.4	54.760000000000005
    7.5	56.25
    7.6000000000000005	57.760000000000005
    7.7	59.290000000000006
    7.800000000000001	60.84000000000001
    7.9	62.410000000000004
    8.0	64.0
    8.1	65.61
    8.200000000000001	67.24000000000002
    8.3	68.89000000000001
    8.4	70.56
    8.5	72.25
    8.6	73.96
    8.700000000000001	75.69000000000001
    8.8	77.44000000000001
    8.9	79.21000000000001
    9.0	81.0
    9.1	82.80999999999999
    9.200000000000001	84.64000000000001
    9.3	86.49000000000001
    9.4	88.36000000000001
    9.5	90.25
    9.600000000000001	92.16000000000003
    9.700000000000001	94.09000000000002
    9.8	96.04000000000002
    9.9	98.01


## 9. Astronomical units

- astropy provides a way to manipulate quantities, automatically taking care of unit conversions automatically
- that's amazing!!!

```python
from astropy import units as u
#defining quantities with units:
val1, val2 = 30.2 * u.cm, 2.2E4 * u.s
val3 = val1 / val2 # will be units cm/s
#converting units
val3km = val3.to(u.km/u.s)
#simplifying
val4 = (10.3 * u.s / (3* u.Hz)).decompose()
```


```python
from astropy import units as u

val = 30.3 * u.cm
print val.to(u.km)

# convert
val1 = 10 * u.km
val2 = 100. * u.m

#simplify
print (val1/val2).decompose()
```

    0.000303 km
    100.0



```python
val1 = 5 * u.m
val2 = 6 * u.s
print(val1/val2)
```

    0.833333333333 m / s


## 10. Astronomical constants

- also so helpful!

```python
from astropy import constants as c
# some constants
c.k_B, c_c, c.M_sun, c.L_sun
# can use with units
energy = c.h * 30 * u.Ghz
# can also convert units
```



```python
from astropy import constants as c

print 'solarmass: ', c.M_sun.value, c.M_sun.unit,'\n'

print (c.c)
```

    solarmass:  1.9891e+30 kg 
    
      Name   = Speed of light in vacuum
      Value  = 299792458.0
      Uncertainty  = 0.0
      Unit  = m / s
      Reference = CODATA 2010



```python
# this is a great way to convert to cgs units
print c.c.cgs
```

    29979245800.0 cm / s


## 11. Astronomical query
- we can use this to query databases.  cool!
- we will do an example with SDSS


```python
from astroquery.sdss import SDSS
from astropy import coordinates as coords
pos = coords.SkyCoord('13h10m27.46s +18d26m17.4s', frame='icrs')
xid = SDSS.query_region(pos, spectro=True)
xid
```

    /Users/jarredgreen/anaconda/lib/python2.7/site-packages/astroquery/sdss/__init__.py:28: UserWarning: Experimental: SDSS has not yet been refactored to have its API match the rest of astroquery (but it's nearly there).
      warnings.warn("Experimental: SDSS has not yet been refactored to have its API "





&lt;Table length=1&gt;
<table id="table4523387984" class="table-striped table-bordered table-condensed">
<thead><tr><th>ra</th><th>dec</th><th>objid</th><th>run</th><th>rerun</th><th>camcol</th><th>field</th><th>z</th><th>plate</th><th>mjd</th><th>fiberID</th><th>specobjid</th><th>run2d</th><th>instrument</th></tr></thead>
<thead><tr><th>float64</th><th>float64</th><th>int64</th><th>int64</th><th>int64</th><th>int64</th><th>int64</th><th>float64</th><th>int64</th><th>int64</th><th>int64</th><th>int64</th><th>int64</th><th>str4</th></tr></thead>
<tr><td>197.614455643</td><td>18.4381688537</td><td>1237668296598749280</td><td>5314</td><td>301</td><td>1</td><td>136</td><td>0.0124487</td><td>2618</td><td>54506</td><td>310</td><td>2947691243863304192</td><td>26</td><td>SDSS</td></tr>
</table>



- now we can get the specra and images for this list of objects using the following commands.
- we will obtain a list with as many objects as the list from xid
- in this case, it's only one object


```python
sp = SDSS.get_spectra(matches=xid)
im = SDSS.get_images(matches=xid, band='r')

print len(sp), len(im)
```

    1 1


- we can also access the SDSS template library
- for instance we will get **qso** template with the command:


```python
template = SDSS.get_spectral_template('qso')
print len(template)
```

    1


- let's go back to the image
- we can emplore what is inside using the **.info** method:


```python
hdulist = im[0]
hdulist.info()
```

    Filename: (No file associated with this HDUList)
    No.    Name         Type      Cards   Dimensions   Format
      0  PRIMARY     PrimaryHDU      96   (2048, 1489)   float32   
      1              ImageHDU         6   (2048,)   float32   
      2              BinTableHDU     27   1R x 3C   [49152E, 2048E, 1489E]   
      3              BinTableHDU     79   1R x 31C   [J, 3A, J, A, D, D, 2J, J, D, D, D, D, D, D, D, D, D, D, D, D, D, D, D, D, D, D, D, D, D, E, E]   


- now let's extract the data


```python
header = hdulist[0].header
data = hdulist[0].data #image in lst extension
print (data.shape, data.dtype.name)

import numpy as np
plt.imshow(np.sqrt(data+1.),origin='lower', cmap='gist_heat', vmax=1.1,vmin=0.9)
plt.colorbar();
```

    ((1489, 2048), 'float32')



![png](output_256_1.png)



```python
# Now plot with coordinates:

header = hdulist[0].header
data = hdulist[0].data #image in lst extension
print (data.shape, data.dtype.name)

fig = plt.figure()
ax = fig.add_axes([0.1,0.1,0.8,0.8], projection=cutout.wcs)
ax.set_xlabel('RA')
ax.set_ylabel('Dec')
ax.imshow(np.sqrt(data+1.),origin='lower', cmap='gist_heat', vmax=1.1,vmin=0.9)
ra = ax.coords[0]
ra.set_major_formatter('hh:mm:ss')
dec = ax.coords[1]
dec.set_major_formatter('dd:mm:ss');

import numpy as np
plt.imshow(np.sqrt(data+1.),origin='lower', cmap='gist_heat', vmax=1.1,vmin=0.9)
plt.colorbar();
```

    ((1489, 2048), 'float32')



![png](output_257_1.png)


## 12. Histograms



```python
# how to display a histogram
# copy his tutorial

import matplotlib.pyplot as plt
c8 = SkyCoord('13h18m27.46s','+18d26m17.4s',frame='icrs')
wcs = WCS(header)
size = 400
cutout = Cutout2D(data, center, size, wcs=wcs)
```


```python
# now lets plot it
ax = plt.subplot(projection=cutout.wcs)
ra = ax.coords[0]
ra.set_major_formatter('hh:mm:ss')
dec = ax.coords[1]
dec.set_major_formatter('dd:mm:ss')
ax.set_xlabel('RA')
ax.set_ylabel('Dec')
ax.imshow(np.sqrt(cutout.data+1.),origin='lower', cmap='gist_heat', vmax=1.1,vmin=0.9, aspect='auto')


a = np.sqrt(cutout.data+1.)
mina=np.min(a)
maxa=np.max(a)
levels = np.arange(mina,maxa,(maxa-mina)/20.)
labels = [item.get_text() for item in ax.get_xticklabels()]
ax.contour(a,levels,color='cyan');
```


![png](output_260_0.png)


- now we're doing something else... but idk what.  Ha!


```python
from astroquery.skyview import SkyView
survey = "WISE 12"
sv = SkyView()
paths = sv.get_images(position=' M 82', survey=['WISE 12','GALEX Near UV'])
```


```python
from astropy.wcs import WCS
wcs1 = WCS(paths[0][0].header)
wcs2 = WCS(paths[1][0].header)
```


```python
fig = plt.figure()
ax = fig.add_axes([0.1, 0.1, 0.8, 0.8], projection=wcs1)
ax.imshow(paths[0][0].data, origin='lower', cmap='gist_heat_r')
ima2 = paths[1][0].data
levels = np.arange(np.nanmin(ima2),np.nanmax(ima2),1.)
levels = np.nanmin(ima2)+[0.02,0.09,0.2]
ax.contour(ima2,levels, transform=ax.get_transform(wcs2),colors='r')

plt.xlabel('RA')
plt.ylabel('Dec')
plt.show()
```


![png](output_264_0.png)


-------

# Lecture 9 — 
### January 16, 2017 (Afternoon)

Todo
  1. project outline
  2. work on project
  
  
## 1.  Project Outline
- Make a GUI window that does something
  - like plotting
  - or something with imaging
- project name:
  - all lowercase
  - no numbers
  - this is usually standard for packages
- make a directory with this name on your computer
- open a repository on github with the same name
  - and run:  ```git init``` 
- make sure to create an empty file in your directory
  -  ```touch __init__.py``` 
- make your main file called:
  -  ```__main__.py``` 
- make __main__.py executable
  - ```chmod +x __main__.py```
  
## 2. Work on project...

-------
# Lecture 10 — Intro to numpy
### January 17, 2017 (Morning)

Todo
  1. creating arrays
  2. linspace and logspace
  3. 2D arrays
  4. random numbers
  5. diagonal matricies
  6. working with CSVs
  7. numpy native format .npy
  8. more numpy features
  9. manipulating arrays
  
  
  
## 1. Creating arrays

use:
```python
import numpy as np
```


```python
import numpy as np
```


```python
a = [0,1,4,5]

import numpy as np

arr = np.array(a)

type(arr)
```




    numpy.ndarray




```python
M = np.array([[1,2],[3,4]])
M
```




    array([[1, 2],
           [3, 4]])




```python
print M.shape
print M.size
print np.size(M)
```

    (2, 2)
    4
    4



```python
# force it to be complex

M = np.array([[1,2],[3,4]] , dtype=complex)
print M
```

    [[ 1.+0.j  2.+0.j]
     [ 3.+0.j  4.+0.j]]



```python
# make a range array
a = np.arange(0,10,0.1)
print a

b = np.arange(4)
print b
```

    [ 0.   0.1  0.2  0.3  0.4  0.5  0.6  0.7  0.8  0.9  1.   1.1  1.2  1.3  1.4
      1.5  1.6  1.7  1.8  1.9  2.   2.1  2.2  2.3  2.4  2.5  2.6  2.7  2.8  2.9
      3.   3.1  3.2  3.3  3.4  3.5  3.6  3.7  3.8  3.9  4.   4.1  4.2  4.3  4.4
      4.5  4.6  4.7  4.8  4.9  5.   5.1  5.2  5.3  5.4  5.5  5.6  5.7  5.8  5.9
      6.   6.1  6.2  6.3  6.4  6.5  6.6  6.7  6.8  6.9  7.   7.1  7.2  7.3  7.4
      7.5  7.6  7.7  7.8  7.9  8.   8.1  8.2  8.3  8.4  8.5  8.6  8.7  8.8  8.9
      9.   9.1  9.2  9.3  9.4  9.5  9.6  9.7  9.8  9.9]
    [0 1 2 3]


## 2. Linspace and logspace

- linspace creates even spacing between two numbers
- log space creates the log version


```python
c = np.linspace(0,10, 11)
print c

s = np.linspace(0,10,3)
print s

l = np.logspace(0,10,11, base=np.e)
print l
```

    [  0.   1.   2.   3.   4.   5.   6.   7.   8.   9.  10.]
    [  0.   5.  10.]
    [  1.00000000e+00   2.71828183e+00   7.38905610e+00   2.00855369e+01
       5.45981500e+01   1.48413159e+02   4.03428793e+02   1.09663316e+03
       2.98095799e+03   8.10308393e+03   2.20264658e+04]



```python
# let's plot the logspace
%matplotlib inline
import matplotlib.pyplot as plt

plt.plot(l, 'ro');
```


![png](output_275_0.png)


## 3. 2D arrays


```python
x, y = np.mgrid[0:5, 0:5]
x
print x
```

    [[0 0 0 0 0]
     [1 1 1 1 1]
     [2 2 2 2 2]
     [3 3 3 3 3]
     [4 4 4 4 4]]


## 4. Random Numbers



```python
from numpy import random

random.randn(5)
```




    array([-0.55327389, -0.82848378, -3.83938099,  0.33373943, -0.55569857])




```python
random.randn(5,5)
```




    array([[-2.2424487 , -2.22635777,  1.25886923, -0.7253765 , -0.23106882],
           [-0.16885923,  1.05945572, -0.09331459, -0.44102382,  0.89738908],
           [-0.71583664,  0.66318537, -0.08309253,  1.43387331,  0.91142132],
           [-0.82796087, -0.21847615, -1.19365134, -0.19924693,  0.01563206],
           [-2.85059809, -0.44371809,  0.44146466,  0.53729729,  1.34920512]])



## 5. Diagonal Matricies



```python
d = np.zeros(5)
f = np.ones(5)
eights = np.ones(5)*8
print d
print f
print eights
```

    [ 0.  0.  0.  0.  0.]
    [ 1.  1.  1.  1.  1.]
    [ 8.  8.  8.  8.  8.]



```python
np.zeros((3,3))
```




    array([[ 0.,  0.,  0.],
           [ 0.,  0.,  0.],
           [ 0.,  0.,  0.]])



## 6. Working with CSVs or TSVs

- you can use
```python
np.genfromtxt('filename.csv')
```
- wow so useful!


```python
%%bash
echo '
1000  1  1  -6.1  -6.1  -15.4
1000  2  1  -5.4   5.5  -12
' > test.dat
```


```python
data = np.genfromtxt('test.dat')
```


```python
data
```




    array([[ 1000. ,     1. ,     1. ,    -6.1,    -6.1,   -15.4],
           [ 1000. ,     2. ,     1. ,    -5.4,     5.5,   -12. ]])




```python
type(data)
```




    numpy.ndarray




```python
data.shape
```




    (2, 6)




```python
# all rows for column zero
print data[:,0]
```

    [ 1000.  1000.]



```python
# all colums for row zero
print data[0,:]
```

    [ 1000.      1.      1.     -6.1    -6.1   -15.4]



```python
# Now let's go reverse and save a random matrix:

M = random.rand(5,3)
M
```




    array([[ 0.55479221,  0.77386399,  0.11425171],
           [ 0.16870586,  0.42865289,  0.12403881],
           [ 0.12202192,  0.29447273,  0.54647833],
           [ 0.20246165,  0.48220605,  0.13684229],
           [ 0.83463444,  0.14320292,  0.44884806]])




```python
np.savetxt("random-matrix.csv", M)
```


```python
!cat random-matrix.csv
```

    5.547922093414258127e-01 7.738639903040632761e-01 1.142517088689203320e-01
    1.687058573972401998e-01 4.286528904516602179e-01 1.240388090268975674e-01
    1.220219234012026588e-01 2.944727271345070063e-01 5.464783312494938539e-01
    2.024616456176745460e-01 4.822060464089179543e-01 1.368422855692188467e-01
    8.346344421110747369e-01 1.432029176776526969e-01 4.488480553108347149e-01



```python
np.savetxt("random-matrix.csv", M, fmt='% 5f')
```


```python
!cat random-matrix.csv
```

     0.554792  0.773864  0.114252
     0.168706  0.428653  0.124039
     0.122022  0.294473  0.546478
     0.202462  0.482206  0.136842
     0.834634  0.143203  0.448848



```python
# now load our text back in!
A = np.loadtxt('random-matrix.csv')
print A
```

    [[ 0.554792  0.773864  0.114252]
     [ 0.168706  0.428653  0.124039]
     [ 0.122022  0.294473  0.546478]
     [ 0.202462  0.482206  0.136842]
     [ 0.834634  0.143203  0.448848]]



```python
# also let's learn gzip or bzip2
# will compress your file
# loadtxt will automatically unzip
!gzip  random-matrix.csv
# or 
# !bzip2 random-matrix.csv
```

    gzip: can't stat: random-matrix.csv (random-matrix.csv): No such file or directory


## 7. numpy's native format .npy

- good if you're just using the files for yourself
- not recommended to distribute these files


```python
np.save("random-matrix.npy",M)
```


```python
!cat random-matrix.npy
```

    �NUMPY F {'descr': '<f8', 'fortran_order': False, 'shape': (5, 3), }          
    �Mf����?q=j~��? ���?�?�N'��?�t�o�?��4���?�6g*�<�?.�&#���?. �|�?�OaC��?�пv��?hf�J��?�nJS��?�$yT�?��1��?


```python
C = np.load("random-matrix.npy")
print C
```

    [[ 0.55479221  0.77386399  0.11425171]
     [ 0.16870586  0.42865289  0.12403881]
     [ 0.12202192  0.29447273  0.54647833]
     [ 0.20246165  0.48220605  0.13684229]
     [ 0.83463444  0.14320292  0.44884806]]


## 8. More numpy features


```python
# gives dimensions of array
M.ndim
```




    2




```python
# total number of bytes
M.nbytes
```




    120




```python
# bytes per element
M.itemsize
```




    8



## 9. Manipulating arrays

### Indexing


```python
M
```




    array([[ 0.55479221,  0.77386399,  0.11425171],
           [ 0.16870586,  0.42865289,  0.12403881],
           [ 0.12202192,  0.29447273,  0.54647833],
           [ 0.20246165,  0.48220605,  0.13684229],
           [ 0.83463444,  0.14320292,  0.44884806]])




```python
M[2,1]
```




    0.29447272713450701




```python
M[1]
```




    array([ 0.16870586,  0.42865289,  0.12403881])




```python
M[0]
```




    array([ 0.55479221,  0.77386399,  0.11425171])




```python
print M[:,0]

print M[0,:]
```

    [ 0.55479221  0.16870586  0.12202192  0.20246165  0.83463444]
    [ 0.55479221  0.77386399  0.11425171]



```python
# assign a new value:
M[0,0] = 1
print M
```

    [[ 1.          0.77386399  0.11425171]
     [ 0.16870586  0.42865289  0.12403881]
     [ 0.12202192  0.29447273  0.54647833]
     [ 0.20246165  0.48220605  0.13684229]
     [ 0.83463444  0.14320292  0.44884806]]



```python
M[1,:] = 4.4
print M
```

    [[ 1.          0.77386399  0.11425171]
     [ 4.4         4.4         4.4       ]
     [ 0.12202192  0.29447273  0.54647833]
     [ 0.20246165  0.48220605  0.13684229]
     [ 0.83463444  0.14320292  0.44884806]]



```python

```
