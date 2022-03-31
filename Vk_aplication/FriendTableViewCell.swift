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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
