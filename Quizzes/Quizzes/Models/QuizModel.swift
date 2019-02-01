//
//  QuizModel.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
struct QuizData:Codable {
  let quiz:[Quizzes]
}
struct Quizzes:Codable {
  let id: String
  let quizTile:String
  let facts: [String]
}
