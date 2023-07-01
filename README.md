# SeaKnifeKit

SeaKnife is a library that allows running C# code with arguments and getting a result back, in Swift.

# Usage
## `SeaKnifeKitRunner`  
### `init(arguments: [String], resultMethod: Int 0-1, projectPath: String)`
#### `arguments`
> `[String]` (array comprised of strings)
Arguments to pass to the child process on start
#### `resultMethod`
> `UInt8` (an integer from 0-256)
States can be as follows:
- **0** Read from STDOUT output of process
- **1** Read file `/tmp/SeaKnifeOuput.txt`
- **Anything else** Crash
#### `projectPath`
> `String` (multiple characters joined together)
Path to executable to run
*It is up to you to determine this and get the full path, like /bin/bash, for example*

### `run()` -> `String`
Run the process detailed on initialization. Returns a string containing the full output

# Example
```swift
import SeaKnifeKit

// in this case, our process logs "Hello!" to STDOUT

let runner = SeaKnifeKitRunner(arguments: [""], resultMethod: 0, projectPath: "~/helloWorld")
print(runner.run()) // prints "Hello!"
```
