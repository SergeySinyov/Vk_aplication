//
//  NewsTableViewCell.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 04.05.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarNews: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var pastName: UILabel!
    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var textNews: UILabel!
    @IBOutlet weak var newsLikeControl: NewsLikeControl!


    override func awakeFromNib() {
        super.awakeFromNib()

        newsLikeControl.addTarget(self, action: #selector(newsLikecontrolTapped), for: .touchUpInside)
    }

    @objc
    func newsLikecontrolTapped () {
        newsLikeControl.isSelected = !newsLikeControl.isSelected

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
