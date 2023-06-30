//
//  SeaKnife.swift
//  SeaKnifeKit
//
//  Created by Hayes Dombroski on 6/28/23.
//

import Foundation

// SeaKnife is a library that allows running C# code with arguments and getting a result back

public struct SeaKnifeKitRunner {
    
    var projectPath: String
    var arguments: [String]
    var resultMethod: UInt8
    // resultMethods:
    //  0: piped output
    //  1: output file read
    
    init(arguments: [String], resultMethod: UInt8, projectPath: String) {
        self.arguments = arguments
        self.resultMethod = resultMethod
        self.projectPath = projectPath
    }
    
    public func run() -> String {
        let task = Process()
        task.launchPath = projectPath
        task.arguments = arguments
        
        switch resultMethod {
            case 0:
                return runWithPipedOutput(task: task)
            case 1:
                return runWithOutputFile(task: task)
            default:
                // crash with error
                fatalError("Invalid result method. Options are 0, and 1. See documentation for more info.")
        }
    }
    
    private func runWithPipedOutput(task: Process) -> String {
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        task.waitUntilExit()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!
        return output
    }
    
    private func runWithOutputFile(task: Process) -> String {
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        task.waitUntilExit()
        
        // read file in /tmp/SeaKnifeOutput.txt for data
        
        let file = "/tmp/SeaKnifeOutput.txt"
        let path=URL(fileURLWithPath: file)
        let text = try? String(contentsOf: path)
        
        return text!
        
    }
}

