//
//  PresentSegue.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 30.05.2022.
//

import UIKit

class PresentSegue: UIStoryboardSegue {

    override func perform() {
        guard let containerView = source.view.superview else {
            return
        }

        containerView.addSubview(destination.view)

        destination.view.frame = CGRect(x: 0,
                                        y: containerView.frame.height,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)

        destination.view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

        UIView.animateKeyframes(
            withDuration: 1,
            delay: 0,
            options: [],
            animations: {

            UIView.addKeyframe(
                withRelativeStartTime: 0,
                relativeDuration: 0.75,
                animations: {
                    self.destination.view.center = self.source.view.center
                })

                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.75,
                    animations: {
                        self.destination.view.transform = .identity
                    })
        },
            completion: { isComplete in

                self.source.present(self.destination, animated: false)

            })
    }
}
