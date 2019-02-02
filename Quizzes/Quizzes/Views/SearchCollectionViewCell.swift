//
//  SearchCollectionViewCell.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

protocol SearchCollectionViewDelegate: AnyObject{
  func addToAllQuizes(index:Int)
}
class SearchCollectionViewCell: UICollectionViewCell {
  weak var delegate: SearchCollectionViewDelegate?
  
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
  
  lazy var addButton:UIButton = {
    let button = UIButton()
    button.backgroundColor = .clear
    button.setImage(#imageLiteral(resourceName: "add-icon-filled.png"), for: .normal)
    button.addTarget(self, action: #selector (addToQuizzes), for: .touchUpInside)
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
  
  private func commonInit(){
    setUpViews()
    layer.borderWidth = 4
  }
  @objc func addToQuizzes(){
    delegate?.addToAllQuizes(index: addButton.tag)
    
  }
}
extension SearchCollectionViewCell{
  private func setUpViews(){
    setUpbuttonConstraints()
    setupLabelConstraints()
  }
  private func setupLabelConstraints(){
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.init(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
  }
 private func setUpbuttonConstraints(){
    addSubview(addButton)
    addButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.init(item: addButton, attribute: .top, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: addButton, attribute: .trailing, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
  NSLayoutConstraint.init(item: addButton, attribute: .height
    , relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .height, multiplier: 0.0, constant: 44).isActive = true
  NSLayoutConstraint.init(item: addButton, attribute: .width, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .width, multiplier: 0, constant: 44).isActive = true
  }
}
