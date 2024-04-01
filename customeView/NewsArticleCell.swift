//
//  NewsArticleCell.swift
//  APIpractice
//
//  Created by Shivakumar Harijan on 29/03/24.
//

import UIKit

class NewsArticleCell: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNib()
    }
    
    private func setupNib() {
      let bundle = Bundle(for: type(of: self))
      let nib = UINib(nibName: "NewsArticleCell", bundle: bundle)
      let contentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
      contentView.frame = bounds
      contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      addSubview(contentView)
    }
    
}
