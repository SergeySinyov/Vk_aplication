//
//  FriendTableViewCell.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 30.03.2022.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var avatarTwo: UIImageView!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var avatarThree: UIImageView!
    @IBOutlet weak var labelThree: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.clickedImageView(_sender:)))
        avatar.isUserInteractionEnabled = true
        avatar.addGestureRecognizer(tapGesture)

    }

    @objc func clickedImageView(_sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
            self.avatar.frame.origin.y -= 3
        }, completion: { _ in

            UIView.animate(withDuration: 0,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 0,
                           options: [],
                           animations: {
                self.avatar.frame.origin.y += 3
            })
        })
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
