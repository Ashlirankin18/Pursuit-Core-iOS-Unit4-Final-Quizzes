//
//  UsersDataHelper.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
final class PersistanceHelper{
  private static let filename = "UserInfo.plist"
  private static var books = [UserModel]()
  
  static func getFavBooks() ->[UserModel]{
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
    if FileManager.default.fileExists(atPath: path){
      if let data = FileManager.default.contents(atPath: path){
        do{
          books = try PropertyListDecoder().decode([UserModel].self, from: data)
        }catch{
          print("no entries found")
        }
      }
    }else{
      print("\(filename) does not exist")
    }
    return books
  }
  static func addItemsToDirectory(entry:UserModel){
    books.append(entry)
    saveItemToDirectory()
  }
  
  static func saveItemToDirectory(){
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
    do{
      let data = try PropertyListEncoder().encode(books)
      try data.write(to: path, options: Data.WritingOptions.atomic)
    } catch{
      print("propertyList encoding error")
    }
  }
  static func deleteItemsFromDirectory(newBook:UserModel,index:Int){
    books.remove(at: index)
    saveItemToDirectory()
  }
  static func updatesTheDirectory(item:UserModel,index:Int){
    books.insert(item, at: index)
    saveItemToDirectory()
  }
}
