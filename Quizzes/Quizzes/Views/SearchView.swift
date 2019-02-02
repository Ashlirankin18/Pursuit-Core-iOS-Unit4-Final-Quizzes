//
//  SearchView.swift
//  Quizzes
//
//  Created by Ashli Rankin on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchView: UIView {

  lazy var searchCollectionView:UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
    collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCell")
    collectionView.clipsToBounds = true
    collectionView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    
    return collectionView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
   super.init(coder: aDecoder)
    commonInit()  }
  
  private func commonInit(){
    setUpViews()
  }
  
}
extension SearchView{
  
  private func setUpViews(){
  setUpCollectionViewConstraints()
  }
  private func setUpCollectionViewConstraints(){
    addSubview(searchCollectionView)
    searchCollectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.init(item: searchCollectionView, attribute: .top, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: searchCollectionView, attribute: .bottom, relatedBy: .equal, toItem: safeAreaLayoutGuide
      , attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: searchCollectionView, attribute: .leading, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint.init(item: searchCollectionView, attribute: .trailing, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
    
  }
}
