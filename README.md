Rename XCode Files
==================

See [this Stack Overflow question](http://stackoverflow.com/questions/26165405/how-to-mass-add-a-2-letter-prefix-namespace-to-objective-c-project) for the source of this file. I've successfully used this a project but use at your own risk.

##Step 1:
Add entries to "rename_classes.txt" file where each line contains a class name from/to pair separated by one or more tabs. Example:
```
MyClassA   ZZMyClassA
MyClassB   ZZMyClassB
MyClassC   ZZMyClassC
```

##Step #2:
Copy and paste both files into the project directory, and run the shell script.

Notes:

- This script will update all references to classes found in the Project File, XIB files, storyboard files, .h & .m source files.
- For each modified file, a backup file with the original contents will be created named "[filename].bak".
- This script only renames .h & .m files. .xib files and Storyboards will need to be renamed by hand.
- 'PROJECT_DIR' can be set to another directory if desired.
- 'RENAME_CLASSES' should point to the file created in Step #1.
