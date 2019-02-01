//
//  UserModel.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
struct UserModel:Codable {
  let id : String
  let userName:String
  let imageData: Data?
  
}
