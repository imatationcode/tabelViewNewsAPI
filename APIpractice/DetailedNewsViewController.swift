//
//  DetailedNewsViewController.swift
//  APIpractice
//
//  Created by Shivakumar Harijan on 01/04/24.
//

import UIKit

class DetailedNewsViewController: UIViewController {

   
    @IBOutlet weak var detailedNewsTextView: UITextView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    var newsContent: articalDataStruct = articalDataStruct(author: "", title: "", urlToImage: "", content: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTitleLabel.text = newsContent.title
        if newsContent.urlToImage != nil {
            let url = URL(string: newsContent.urlToImage!)
            newsImageView.downloadImage(from: url!)
            newsImageView.contentMode = .scaleToFill
            
        } else {
            newsImageView.image = UIImage(named: "SoftmonksLogo")
        }
        detailedNewsTextView.text = newsContent.content
    }
    


}
