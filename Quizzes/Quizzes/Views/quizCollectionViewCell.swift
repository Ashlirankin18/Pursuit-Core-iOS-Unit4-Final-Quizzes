//
//  quizCollectionViewCell.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizCollectionViewCell: UICollectionViewCell {
  
  lazy var titleLabel:UILabel = {
    let label = UILabel()
    label.text = "Title"
    label.textColor = .black
    label.backgroundColor = .clear
    label.font = UIFont(name: "Times", size: 20)
    return label
  }()
  
  lazy var addButton:UIButton = {
    let button = UIButton()
    button.backgroundColor = .white
    button.setImage(#imageLiteral(resourceName: "more-filled.png"), for: .normal)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
   super.init(coder: aDecoder)
    commonInit()
  }
  
  func commonInit(){
    setUpViews()
    layer.borderWidth = 4
  }
}
extension QuizCollectionViewCell{
  func setUpViews(){
    setUpbuttonConstraints()
    setupLabelConstraints()
  }
  func setupLabelConstraints(){
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.init(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
  }
  func setUpbuttonConstraints(){
    addSubview(addButton)
    addButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.init(item: addButton, attribute: .top, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: addButton, attribute: .trailing, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
  }
}
