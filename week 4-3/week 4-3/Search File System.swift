//
//  Search File System.swift
//  week 4-3
//
//  Created by Lia on 2020/11/25.
//

import Foundation

func files(at path: String) -> Array<String> {
    let fileManager = FileManager()
    var fileContents = [String]()
    do {
        // contentsOfDirectory(atPath:)가 해당 디렉토리 안의 파일 리스트를 배열로 반환
        let contents = try fileManager.contentsOfDirectory(atPath: path)
        fileContents = contents
    } catch let error as NSError {
        print("Error access directory: \(error)")
    }
        
    return fileContents.sorted()
}

func isExist(filename: String, at path: String) -> Bool {
    let fileContents = files(at: path)
    return fileContents.contains(filename)
}

func fileExtension(which extensionName: String, at path: String) -> Array<String> {
    let fileContents = files(at: path)
    var extensionFiles = [String]()
    
    for index in 0..<fileContents.count {
        if fileContents[index].contains(extensionName) {
            extensionFiles.append(fileContents[index])
        }
    }
    return extensionFiles.sorted()
}
