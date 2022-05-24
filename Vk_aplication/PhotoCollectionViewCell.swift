//
//  PhotoCollectionViewCell.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 30.03.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var likeControl: LikeControl!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        likeControl.addTarget(self, action: #selector(likeControlTapped), for: .touchUpInside)

    }

    @objc
    func  likeControlTapped() {
        likeControl.isSelected = !likeControl.isSelected
    }
    

}
