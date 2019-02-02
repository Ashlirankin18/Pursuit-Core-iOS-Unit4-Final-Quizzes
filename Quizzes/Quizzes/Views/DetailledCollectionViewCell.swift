//
//  DetailledCollectionViewCell.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailledCollectionViewCell: UICollectionViewCell {
  
  lazy var infotextView:UITextView = {
    let textView = UITextView()
    textView.backgroundColor = .clear
    textView.text = "Title"
    textView.font = UIFont(name: "Times", size: 20)
    textView.textAlignment = .center
    textView.isEditable = false
    textView.textColor = .black
    return textView
  }()
  
  lazy var titleLabel:UILabel = {
    let label = UILabel()
    label.text = "Title"
    label.textColor = .black
    label.backgroundColor = .clear
    label.font = UIFont(name: "Times", size: 24)
    label.textAlignment = .center
    label.numberOfLines = 0
    
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
    backgroundColor = #colorLiteral(red: 0.7733321086, green: 0.7940185196, blue: 1, alpha: 1)
  }
  
  required init?(coder aDecoder: NSCoder) {
   super.init(coder: aDecoder)
    commonInit()
  }
  func commonInit(){
    setUpViews()
  }
}
extension DetailledCollectionViewCell{
  func setUpViews(){
       setUpTextViewConstraints()
    }
   
  
 
  func setUpTextViewConstraints (){
    addSubview(infotextView)
    infotextView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.init(item: infotextView, attribute: .top, relatedBy: .lessThanOrEqual, toItem: safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 240).isActive = true
    NSLayoutConstraint.init(item: infotextView, attribute: .bottom, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .bottom, multiplier: 0.8, constant: 0).isActive = true
    NSLayoutConstraint.init(item: infotextView, attribute: .leading, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: infotextView, attribute: .trailing, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
  }
  func setLabelConstraints(){
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.init(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
  }
  }

