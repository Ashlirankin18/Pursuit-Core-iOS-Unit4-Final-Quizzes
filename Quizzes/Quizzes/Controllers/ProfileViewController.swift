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

  @IBOutlet weak var userNameButton: UIButton!
  
  @IBOutlet weak var profilePictureButton: UIButton!
  
  var alertController: UIAlertController!
  var imagePickerController: UIImagePickerController!
  var tapGesture = UITapGestureRecognizer()
  var errorAlertController: UIAlertController!
  
  var chosenUserName = "" {
    didSet{
      self.userNameButton.setTitle("@\(chosenUserName)", for: .normal)
    }
  }
  var currentIndex = 0
  var didFinishProfileSetUp = Bool()
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
   
    setUpImagePickerController()
    didFinishProfileSetUp = false
    signUporSignedIn()
    rounderImages()
    print(PersistanceHelper.getUserInfo())
    }
    
  
  private func rounderImages(){
   profilePictureButton.layer.cornerRadius = userNameButton.bounds.width/2
    profilePictureButton.clipsToBounds = true
  }
  @IBAction func profileImagePressed(_ sender: UIButton) {
    imagePickerController.sourceType = .photoLibrary
     showimagePickerController()
  }
  
  @IBAction func userNamePressed(_ sender: UIButton) {
    if sender.isTouchInside {
      self.setUpAlertController(title: "Welcome!", message: "Create a new flashCard Username")
      currentIndex += 1
    }
  }
  
  
  private func setUpAlerts(title:String,message:String){
    errorAlertController = UIAlertController()
    errorAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default)
    errorAlertController.addAction(okAction)
    self.present(errorAlertController, animated: true, completion: nil)
  }

  private func setUpImagePickerController(){
    imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    
  }
  
  private func showimagePickerController(){
    self.present(imagePickerController, animated: true, completion: nil)
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
  
  func signUporSignedIn(){
    if PersistanceHelper.getUserInfo().isEmpty {
      setUpAlertController(title: "Enter your username", message: "Please enter a username that does not contain any special characthers or numbers ")
    }else{
      let user = PersistanceHelper.getUserInfo()[currentIndex]
      if let data = user.imageData {
        
        self.profilePictureButton.setImage(UIImage(data: data), for: .normal)
      }
      self.userNameButton.setTitle(user.userName, for: .normal)
      setUpAlerts(title: "Welcome", message: "Welcome back \(user.userName)")
   
    }
    
  }
  private func getImageData(image:UIImage,userName:String){
    let data = image.jpegData(compressionQuality: 0.5)
    let id = UUID().uuidString
    let user = UserModel.init(id: id, userName: userName, imageData: data)
    PersistanceHelper.addItemsToDirectory(entry: user)
    setUpAlerts(title: "Sign Up complete!", message: "Thank you \(userName) for signing up")
  }

}
extension ProfileViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      if let username = self.userNameButton.currentTitle{
        profilePictureButton.setImage(image, for: .normal)
        getImageData(image: image, userName: username)
      }
    }else {
      self.setUpAlerts(title: "No images found", message: "Please make sure you have image in for photo library")
    }
    dismiss(animated: true, completion: nil)
  }
}
