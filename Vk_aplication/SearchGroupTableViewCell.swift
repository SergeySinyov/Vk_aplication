//
//  SearchGroupTableViewCell.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 31.03.2022.
//

import UIKit

class SearchGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarFilms: UIImageView!
    @IBOutlet weak var labelFilms: UILabel!
    @IBOutlet weak var avatarFasion: UIImageView!
    @IBOutlet weak var labelFasion: UILabel!
    @IBOutlet weak var avatarWebDesing: UIImageView!
    @IBOutlet weak var labelWebDesing: UILabel!
    




    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
