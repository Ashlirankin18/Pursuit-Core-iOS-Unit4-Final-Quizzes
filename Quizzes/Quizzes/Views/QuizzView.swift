//
//  QuizzView.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzView: UIView {
  lazy var quizCollectionView:UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
     let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
    collectionView.register(QuizCollectionViewCell.self, forCellWithReuseIdentifier: "QuizCell")
    collectionView.clipsToBounds = true
    collectionView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    
    return collectionView
  }()
  lazy var infotextView:UITextView = {
    let textView = UITextView()
    textView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    textView.text = "There are no quizzes at this time. You can create you own quizzes by going to the Create pane.You can also browse our online collection of puizzes in the search pane."
    textView.font = UIFont(name: "Times", size: 20)
    textView.textAlignment = .center
    
    return textView
  }()
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit(){
    setUpViews()
  }
}
extension QuizzView{
  func setUpViews(){
    if PersistanceHelper.getUserInfo().isEmpty{
      setUpTextViewConstraints()
    }else{
      setIUpCollectionViewConstraints()
    }
    
  }
  
  func setIUpCollectionViewConstraints(){
    addSubview(quizCollectionView)
    quizCollectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.init(item: quizCollectionView, attribute: .top, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: quizCollectionView, attribute: .bottom, relatedBy: .equal, toItem: safeAreaLayoutGuide
      , attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: quizCollectionView, attribute: .leading, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: quizCollectionView, attribute: .trailing, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
    
  }
  func setUpTextViewConstraints (){
    addSubview(infotextView)
    infotextView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.init(item: infotextView, attribute: .top, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: infotextView, attribute: .bottom, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: infotextView, attribute: .leading, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: infotextView, attribute: .trailing, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
  }
}
