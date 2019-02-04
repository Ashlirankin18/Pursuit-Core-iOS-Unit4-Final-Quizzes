//
//  OnlineQuizApiClient.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
final class OnlineQuizApiClient{
  static func getQuizes(completionHandler: @escaping (AppError?,[Quizzes]?) -> Void){
    let urlString =  "https://quizzes-9ff59.firebaseio.com/.json"
    NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (error, data) in
      if let error = error{
        completionHandler(AppError.badURL("The URL that was used is invalid \(error)"),nil)
      }
      if let data = data {
        do{
         let quizes =  try JSONDecoder().decode([Quizzes].self, from: data)
          completionHandler(nil,quizes)
        }catch{
          completionHandler(AppError.jsonDecodingError(error),nil)
        }
      }
    }
  }
}
