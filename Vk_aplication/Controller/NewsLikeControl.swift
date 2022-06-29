//
//  NewsLikeControl.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 06.05.2022.
//

import UIKit

class NewsLikeControl: UIControl {

    @IBOutlet weak var likeImage: UIImageView?
    @IBOutlet weak var likeCounterLable: UILabel?

    var likeCounter: Int = 0

    override var isSelected: Bool {
        didSet {
            likeImage?.image = isSelected ? UIImage(named: "likeUnable") : UIImage(named: "likeDisable")

            if isSelected {
                self.likeCounter += 1
            } else {
                likeCounter -= 1
            }

            likeCounterLable?.text = "\(likeCounter)"

        }
    }

}
