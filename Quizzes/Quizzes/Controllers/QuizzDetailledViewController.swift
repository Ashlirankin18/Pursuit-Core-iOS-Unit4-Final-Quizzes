//
//  QuizzDetailledViewController.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzDetailledViewController: UIViewController {

  
  private var detailledView: QuizDetailledView!
  private var flashCard:  Quizzes!
  
  init(flashCard: Quizzes,view:QuizDetailledView) {
    super.init(nibName: nil, bundle: nil)
    self.flashCard = flashCard
    self.detailledView = view
    self.view.addSubview(view)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
   var isAnswerDisplay = Bool()
  
  override func viewDidLoad() {
        super.viewDidLoad()
  self.detailledView.backgroundColor = .white
    self.detailledView.quizDetailledCollectionView.dataSource = self
    self.detailledView.quizDetailledCollectionView.delegate = self
    isAnswerDisplay = false
    }
    

   

}
extension QuizzDetailledViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: 350, height: 500)
  }
  
}
extension QuizzDetailledViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = detailledView.quizDetailledCollectionView.dequeueReusableCell(withReuseIdentifier: "DetailledCell", for: indexPath) as? DetailledCollectionViewCell else {fatalError()}
      cell.infotextView.text  = flashCard.quizTitle
    
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    guard let cell = detailledView.quizDetailledCollectionView.cellForItem(at: indexPath) as? DetailledCollectionViewCell else {fatalError()}
    
    if cell.infotextView.text == flashCard.quizTitle{
      cell.infotextView.text = flashCard.facts[indexPath.row]
      UIView.animate(withDuration: 2, delay: 0, options: [.transitionFlipFromRight], animations: {
        
      }, completion: nil)
    }else if cell.infotextView.text == flashCard.facts[indexPath.row]{
      
      cell.infotextView.text = flashCard.quizTitle
      
    }
    
    
    
//      cell.infotextView.text = flashCard.quizTitle
//    UIView.animate(withDuration: 3.0, delay: 0.0, options: [.transitionFlipFromRight], animations: {
//      collectionView.cellForItem(at: indexPath)?.transform = CGAffineTransform.in
//      collectionView.cellForItem(at: indexPath)?.alpha = 0
//    }) { (done) in
//
    
//      collectionView.cellForItem(at: indexPath)?.alpha = 1
//      cell.infotextView.text = self.flashCard.facts[indexPath.row]
//       collectionView.cellForItem(at: indexPath)?.transform = CGAffineTransform.identity
//
//    }
    
  }

  
}
