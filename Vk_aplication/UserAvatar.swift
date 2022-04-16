//
//  UserAvatar.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 16.04.2022.
//

import UIKit

class UserAvatar: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.backgroundColor = UIColor.systemBlue.cgColor
        layer.cornerRadius = 20

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 15
        layer.shadowOpacity = 2

    }
}
