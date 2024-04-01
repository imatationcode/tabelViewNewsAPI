//
//  listTTableViewCell.swift
//  APIpractice
//
//  Created by Shivakumar Harijan on 30/03/24.
//

import UIKit

class ListTTableViewCell: UITableViewCell {

    @IBOutlet weak var newsAuthLable: UILabel!
    @IBOutlet weak var newsHeadingLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImageView.image = nil
    }

}
