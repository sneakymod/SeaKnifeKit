# SeaKnifeKit

SeaKnife is a library that allows running C# code with arguments and getting a result back, in Swift.

> Warning! This README is not written by a Swift user/developer. Please correct me if I'm wrong, but...  

# Usage

Initialize SeaKnife with `init(args, resultMethod, projectPath)`.  
You'll want to then run said initialized code with `run()`.  
Note that `resultMethod` is either 0 or 1, 0 piping output, and 1 outputting to a file.  
**If it's not any of those the program will crash.**  
If you do choose to run with file output, it will go to `/tmp/SeaKnightOutput.txt`.