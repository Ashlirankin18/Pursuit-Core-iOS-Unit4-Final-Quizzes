//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

  @IBOutlet var searchView: SearchView!
  
  var onlineQuizes = [Quizzes](){
    didSet{
      DispatchQueue.main.async{
        self.searchView.searchCollectionView.reloadData()
        
      }
    }
    }
  var errorAlertController: UIAlertController!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      searchView.searchCollectionView.dataSource = self
      searchView.searchCollectionView.delegate = self
      searchView.searchBar.delegate = self
      getOnlineQuizes()
     
    }
  
 private func getOnlineQuizes(){
    OnlineQuizApiClient.getQuizes { (error, quizes) in
      if let error = error {
        print(error.errorMessage())
      }
      if let quizes = quizes {
        self.onlineQuizes = quizes
      }
    }
  }

  private func setUpAlerts(title:String,message:String){
    errorAlertController = UIAlertController()
    errorAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default)
    errorAlertController.addAction(okAction)
    self.present(errorAlertController, animated: true, completion: nil)
  }
}

extension SearchViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: 400, height: 300)
  }
  
}
extension SearchViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = searchView.searchCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCollectionViewCell else {fatalError()}
    let flashCard = onlineQuizes[indexPath.row]
    
    cell.titleLabel.text = flashCard.quizTitle
    cell.delegate = self
    cell.addButton.tag = indexPath.row
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return onlineQuizes.count
  }
}
extension SearchViewController:SearchCollectionViewDelegate{
  func addToAllQuizes(index: Int) {
    let flashcard = onlineQuizes[index]
    if OnlineQuizHelper.getQuizes().contains(where: { (quiz) -> Bool in
      quiz.id == flashcard.id
    }){
      setUpAlerts(title: "Duplicate Quiz", message: "Quiz is already in your collection")
    }else{
    OnlineQuizHelper.addItemsToDirectory(quiz: flashcard)
    self.setUpAlerts(title: "FLASHCARD ADDED", message: "Your Flashcard was sucessfully added")
    tabBarController?.selectedViewController = tabBarController?.viewControllers![0]
  }
  }
}
extension SearchViewController:UISearchBarDelegate{
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    if searchBar.text!.isEmpty{
      getOnlineQuizes()
    }
    else if let text = searchBar.text {
      let searchResults = onlineQuizes.filter{$0.quizTitle.contains(text)}
      if searchResults.isEmpty {
        title = "Number of Flashcards: \(onlineQuizes.count)"
        setUpAlerts(title: "No Results", message: "No Flashcards were found!")
      }else{
        onlineQuizes = searchResults
        title = "Number of Flashcards: \(onlineQuizes.count)"
      }
    }

  }
  
}
