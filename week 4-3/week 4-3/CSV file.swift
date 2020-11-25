//
//  CSV file.swift
//  week 4-3
//
//  Created by Lia on 2020/11/25.
//

import Foundation

// 작성된 CSV 파일을 생성 초기화 init 매개변수로 넘기면, 파일을 읽어서 내부에 배열과 사전 조합으로 생성하는 클래스를 작성한다.
class CSVfile {
    
    var peopleInformation : [Dictionary<String, Any>]
    
    init(fileName: String) {
        let fileManager = FileManager()
        let url = fileManager.urls(for: .desktopDirectory , in: .userDomainMask).first!
        peopleInformation = []
        
        do {
            let filePath = url.appendingPathComponent(fileName)
            let read = try String(contentsOf: filePath)
            let lines = read.components(separatedBy: "\n")
            
            for index in 1..<lines.count {
                let tempLine = lines[index].components(separatedBy: ", ")
                self.add(name: tempLine[0], email: tempLine[1], language: tempLine[2], grade: Int(tempLine[3])!)
            }
        } catch let error as NSError {
            print("Error Reading File : \(error.localizedDescription)")
        }
    }
    
    // 새로운 사람을 추가하는 메소드
    func add(name: String, email: String, language: String, grade: Int){
        peopleInformation.append(["name": name, "email": email, "language": language, "grade": grade])
    }
    
    // 이름으로 해당 사람에 대한 정보 사전Dictionary을 넘기는 메소드
    func findBy(name: String) -> Dictionary<String, Any> {
        for index in 0..<peopleInformation.count{
            if peopleInformation[index]["name"] as! String == name { return peopleInformation[index] }
        }
        return [:]
    }
    
    // 이메일 주소로 해당 사람 정보를 지우는 메소드
    // 매칭되는 주소가 있어서 지웠으면 true, 찾지 못했으면 false를 리턴한다
    func removeBy(email: String) -> Bool {
        for index in 0..<peopleInformation.count{
            if peopleInformation[index]["email"] as! String == email {
                peopleInformation.remove(at: index)
                return true
            }
        }
        return false
    }
    
    // 특정한 CSV 파일이름으로 저장하는 메소드
    // 파일이 없어서 제대로 생성하고 나면 true, 파일이 이미 있으면 false를 return한다
    func write(to file: String) -> Bool {
        let fileManager = FileManager()
        let desktopPath = fileManager.urls(for: .desktopDirectory, in: .userDomainMask).first!
        let filePath = desktopPath.appendingPathComponent(file)
        var text = "name, email, language, grade\n"
        
        do {
            let url = desktopPath.absoluteString.components(separatedBy: ":/")
            if isExist(filename: file, at: url[1])  {  return false  }
            
            for index in 0..<peopleInformation.count {
                text += "\(peopleInformation[index]["name"] ?? ""), \(peopleInformation[index]["email"] ?? ""), \(peopleInformation[index]["language"] ?? ""), \(peopleInformation[index]["grade"] ?? "")\n"
            }
            try text.write(to: filePath, atomically: false, encoding: .utf8)
        }
        catch let error as NSError {
            print("Error Writing File : \(error.localizedDescription)")
            return false
        }
        return true
    }
    
    func printInfo() {
        print(peopleInformation)
    }
}
