//
//  QuizDetailledView.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetailledView: UIView {
  
  lazy var quizDetailledCollectionView:UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
    collectionView.register(DetailledCollectionViewCell.self, forCellWithReuseIdentifier: "DetailledCell")
    collectionView.clipsToBounds = true
    collectionView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.5698142756, blue: 0.4358009918, alpha: 1)
    
    return collectionView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  func commonInit(){
    setUpViews()
    self.backgroundColor = #colorLiteral(red: 1, green: 0.4323762941, blue: 0.4920702767, alpha: 1)
  }
  
}
extension QuizDetailledView{
  func setUpViews(){
   
    setUpCollectionViewConstriaints()
  }
  
  func setUpCollectionViewConstriaints(){
    addSubview(quizDetailledCollectionView)
quizDetailledCollectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.init(item: quizDetailledCollectionView, attribute: .top, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: quizDetailledCollectionView, attribute: .bottom, relatedBy: .equal, toItem: safeAreaLayoutGuide
      , attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: quizDetailledCollectionView, attribute: .leading, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: quizDetailledCollectionView, attribute: .trailing, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
    
  }
  
}
