//
//  OnlineQuizHelper.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
final class OnlineQuizHelper{
  private static let filename = "OnlineQuiz.plist"
  private static var quizes = [Quizzes]()
  
  static func getQuizes() ->[Quizzes]{
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
    if FileManager.default.fileExists(atPath: path){
      if let data = FileManager.default.contents(atPath: path){
        do{
          quizes = try PropertyListDecoder().decode([Quizzes].self, from: data)
        }catch{
          print("no entries found")
        }
      }
    }else{
      print("\(filename) does not exist")
    }
    return quizes
  }
  static func addItemsToDirectory(quiz:Quizzes){
    quizes.append(quiz)
    saveItemToDirectory()
  }
  
  static func saveItemToDirectory(){
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
    do{
      let data = try PropertyListEncoder().encode(quizes)
      try data.write(to: path, options: Data.WritingOptions.atomic)
    } catch{
      print("propertyList encoding error")
    }
  }
  static func deleteItemsFromDirectory(newBook:Quizzes,index:Int){
    quizes.remove(at: index)
    saveItemToDirectory()
  }
  static func updatesTheDirectory(quiz:Quizzes,index:Int){
    quizes.insert(quiz, at: index)
    saveItemToDirectory()
  }
}
