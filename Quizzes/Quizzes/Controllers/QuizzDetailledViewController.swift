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
    cell.alpha =  1
    if cell.infotextView.text == flashCard.quizTitle {
      UIView.animate(withDuration: 1, delay: 0, options: [.transitionFlipFromTop,.transitionFlipFromLeft], animations: {
        cell.alpha = 0
      }) { (done) in
         cell.alpha = 1
        cell.infotextView.text = self.flashCard.facts[indexPath.row]
        
      }
    }else if cell.infotextView.text == flashCard.facts[indexPath.row]{
      UIView.animate(withDuration: 1, delay: 0, options: [.transitionFlipFromLeft], animations: {
        cell.alpha = 1
        cell.infotextView.text = self.flashCard.quizTitle
      }, completion: nil)
     
      
    }
    
}
}
