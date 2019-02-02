//
//  CreateViewController.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
  @IBOutlet weak var titleTextfield: UITextField!
  @IBOutlet weak var fact2TextView: UITextView!
  @IBOutlet weak var fact1TextView: UITextView!
  
  private var alertController: UIAlertController!
  
  @IBOutlet weak var createButton: UIBarButtonItem!
  override func viewDidLoad() {
        super.viewDidLoad()
    isUserSignedIn()
    self.createButton.isEnabled = false
    titleTextfield.delegate = self
    }
  
  func setUpAlertController(title:String,message:String){
    alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alertController.addAction(okAction)
    self.present(alertController, animated: true, completion: nil)
  }
  func isUserSignedIn(){
    if PersistanceHelper.getUserInfo().isEmpty{
      setUpAlertController(title: "SignIn Required", message: "You are not signed in, please head over to the profile page and create an account")
    }else{
      
      setUpAlertController(title: "Welcome Back", message: "Welcome back, would you like to create a quiz today?")
    }
  }
  func quizReadyToBeCreated(){
    if fact1TextView.text.isEmpty && fact2TextView.text.isEmpty && !(titleTextfield.text?.isEmpty)!{
      setUpAlertController(title: "Cannot Create", message: "Two facts are required!!")
    }
    else if (!fact1TextView.text.isEmpty && fact2TextView.text.isEmpty && !(titleTextfield.text?.isEmpty)!) || ((fact1TextView.text.isEmpty && !fact2TextView.text.isEmpty && !(titleTextfield.text?.isEmpty)!)) {
      setUpAlertController(title: "Cannot Create", message: "Two facts are required!!")
    }else if (!fact1TextView.text.isEmpty && !fact2TextView.text.isEmpty && !(titleTextfield.text?.isEmpty)!) {
      let title = titleTextfield.text ?? "No text found"
      let factOne = fact1TextView.text ?? "No first fact was entered"
      let factTwo = fact2TextView.text ?? "Second fact was not entered"
      createFlashCard(title: title, factOne: factOne, factTwo: factTwo)
    }
    
  }
  func createFlashCard(title:String,factOne:String,factTwo:String){
    let factArray = [factOne,factTwo]
    let quiz = Quizzes.init(id: "", quizTitle: title, facts: factArray)
    OnlineQuizHelper.addItemsToDirectory(quiz: quiz)
    tabBarController?.selectedViewController = tabBarController?.viewControllers![0]
  }
  @IBAction func createButtonPressed(_ sender: UIBarButtonItem) {
   quizReadyToBeCreated()
  }
  
  @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
    tabBarController?.selectedViewController = tabBarController?.viewControllers?[0]
  }
  
    

}
extension  CreateViewController:  UITextFieldDelegate{
  func textFieldDidBeginEditing(_ textField: UITextField) {
    self.createButton.isEnabled = true
  }
}
