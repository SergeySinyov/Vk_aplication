//
//  LoadingViewController.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 11.05.2022.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var circleOne: UIImageView!
    @IBOutlet weak var circleTwo: UIImageView!
    @IBOutlet weak var circleThree: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 0.7,
                       delay: 0.5,
                       options: [.repeat, .autoreverse],
                       animations: {
            self.circleOne.alpha = 0
        })

        UIView.animate(withDuration: 0.7,
                       delay: 1,
                       options: [.repeat, .autoreverse],
                       animations: {
            self.circleTwo.alpha = 0
        })

        UIView.animate(withDuration: 0.7,
                       delay: 1.5,
                       options: [.repeat, .autoreverse],
                       animations: {
            self.circleThree.alpha = 0
        })

    }

}

