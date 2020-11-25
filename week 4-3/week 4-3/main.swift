//
//  main.swift
//  week 4-3
//
//  Created by Lia on 2020/11/25.
//

import Foundation


//print(files(at: "/Users/gimjigyeong/Desktop"))
//print(isExist(filename: "2020.11.docx", at: "/Users/gimjigyeong/Desktop"))
//print(fileExtension(which: ".doc", at: "/Users/gimjigyeong/Desktop"))


let test = CSVfile(fileName: "peopleInfo.csv")

print("원본: ")
test.printInfo()

print("\n JK의 정보를 찾습니다")
print(test.findBy(name: "JK"))

print("\n Crong의 정보를 지웁니다")
print(test.removeBy(email: "crong@codesquad.kr"))
print("\n Crong의 정보를 지웁니다")
print(test.removeBy(email: "crong@codesquad.kr"))
print("\n 현재 남은 정보: ")
test.printInfo()
print("------")

print("\n 파일을 저장할 수 있나요? ")
print(test.write(to: "revised.csv"))
