//
//  QuizzViewController.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzViewController: UIViewController {

  @IBOutlet var quizView: QuizzView!
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      quizView.quizCollectionView.dataSource = self
      quizView.quizCollectionView.delegate = self
      
    }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.quizView.quizCollectionView.reloadData()
  }

}
extension QuizzViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: 400, height: 300)
  }
}
extension QuizzViewController:UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print(OnlineQuizHelper.getQuizes().count)
    return OnlineQuizHelper.getQuizes().count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = quizView.quizCollectionView.dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as? QuizCollectionViewCell else {fatalError()}
    let flashCard = OnlineQuizHelper.getQuizes()[indexPath.row]
    cell.titleLabel.text = flashCard.quizTitle
    cell.addButton.tag = indexPath.row
    cell.delegate = self
    
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let flashCard = OnlineQuizHelper.getQuizes()[indexPath.row]
    let detailledView = QuizDetailledView()
    let detailledViewController = QuizzDetailledViewController.init(flashCard: flashCard, view: detailledView)
    
    
    self.navigationController?.pushViewController(detailledViewController, animated: true)
  }
  
}
extension QuizzViewController:QuizCollectionViewCellDelegate{
  func removeFlashCard(index: Int) {
    let flashCard = OnlineQuizHelper.getQuizes()[index]
    OnlineQuizHelper.deleteItemsFromDirectory(newBook: flashCard, index: index)
    self.quizView.quizCollectionView.reloadData()
  }
  
  func presentActionsheet(alertController: UIAlertController) {
    self.present(alertController, animated: true, completion: nil)
  }
  
  
}
