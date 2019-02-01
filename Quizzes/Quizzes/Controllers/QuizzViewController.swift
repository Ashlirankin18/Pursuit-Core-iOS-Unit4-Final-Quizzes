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
    

}
extension QuizzViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: 200, height: 200)
  }
}
extension QuizzViewController:UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = quizView.quizCollectionView.dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as? QuizCollectionViewCell else {fatalError()}
    return cell
  }
  
  
}
