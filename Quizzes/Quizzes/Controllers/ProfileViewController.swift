//
//  ProfileViewController.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
import AVFoundation

class ProfileViewController: UIViewController {

  @IBOutlet weak var userImage: UIImageView!
  @IBOutlet weak var userNameButton: UIButton!
  var alertController: UIAlertController!
  var imagePickerController: UIImagePickerController!
  var tapGesture = UITapGestureRecognizer()
  var errorAlertController: UIAlertController!
  var chosenUserName = "" {
    didSet{
      self.userNameButton.setTitle("@ \(chosenUserName)", for: .normal)
    }
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
    setUpAlertController(title: "Enter your username", message: "Please enter a username that does not contain any special characthers or numbers ")
    userImage.addGestureRecognizer(addTapGesture())
    setUpImagePickerController()
    }
  
  private func setUpErrorAlerts(title:String,message:String){
    errorAlertController = UIAlertController()
    errorAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default)
    errorAlertController.addAction(okAction)
    self.present(alertController, animated: true, completion: nil)
  }
  private func setUpImagePickerController(){
    imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    
  }
  
  private func showimagePickerController(){
    self.present(imagePickerController, animated: true, completion: nil)
  }
  
  private func addTapGesture() -> UITapGestureRecognizer {
    tapGesture.addTarget(self, action: #selector(setImage))
    tapGesture.numberOfTapsRequired = 1
    return tapGesture
  }
  
  @objc func setImage(){
    imagePickerController.sourceType = .photoLibrary
    showimagePickerController()
  }
  
  
  
  
  private func setUpAlertController(title:String,message:String){
    alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let submitAction = UIAlertAction(title: "Sumbit", style: .default) { (submit) in
      guard let userName = self.alertController.textFields?.first?.text else {
        print("No text was found")
        return}
        self.chosenUserName = userName
      
    }
    
    alertController.addTextField { (createTextfield) in
      createTextfield.placeholder = "Enter a username here"
      createTextfield.textAlignment = .center
      
    }
    alertController.addAction(submitAction)
    self.present(alertController, animated: true, completion: nil)
  }
  
  func signUporSignedIn(usersDatabase:[UserModel]){
    if usersDatabase.isEmpty {
      self.present(alertController, animated: true, completion: nil)
    }else{
      
    }
  }
  private func didFinishProfileSetUp(){}

}
extension ProfileViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      userImage.image = image
    }else {
      self.setUpErrorAlerts(title: "No images we found", message: "Please make sure you have image in for photo library")
    }
    dismiss(animated: true, completion: nil)
  }
}
