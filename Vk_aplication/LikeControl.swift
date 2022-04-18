//
//  LikeControl.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 17.04.2022.
//

import UIKit

class LikeControl: UIControl {

    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var counterLable: UILabel?

    var likecounter: Int = 0

    override var isSelected: Bool {
        didSet {
            imageView?.image = isSelected ? UIImage(named: "likeUnable") : UIImage(named: "likeDisable")

            if isSelected {
                likecounter += 1
            } else {
                likecounter -= 1
            }

            counterLable?.text = "\(likecounter)"
        }
    }

}
