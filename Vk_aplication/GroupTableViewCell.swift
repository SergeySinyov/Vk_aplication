//
//  GroupTableViewCell.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 30.03.2022.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarGroupFootball: UIImageView!
    @IBOutlet weak var labelFootbal: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
