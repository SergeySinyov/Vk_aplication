//
//  SlideImageViewController.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 23.05.2022.
//

import UIKit

class SlideImageViewController: UIViewController {

    @IBOutlet weak var fimageView: UIImageView!
    @IBOutlet weak var simageView: UIImageView!


    var photos: [String] = []

    var currentPhotoIndex: Int?

    var nextPhotoIndex: Int? {
        guard let index = currentPhotoIndex else {
            return nil
        }

        let nextIndex = index + 1
        return nextIndex < photos.count ? nextIndex : nil
    }

    var previousPhotoIndex: Int? {
        guard let index = currentPhotoIndex else {
            return nil
        }

        let prevIndex = index - 1
        return prevIndex > -1 ? prevIndex :  nil
    }

    var currentPhoto: String? {
        guard let index = currentPhotoIndex else {
            return nil
        }

        return photos[index]
    }

    var currentImageView: UIImageView? {
        [fimageView, simageView].first(where: { !$0.isHidden })
    }

    var hiddenImageView: UIImageView? {
        [fimageView, simageView].first(where: { $0.isHidden })
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        currentPhotoIndex = photos.isEmpty ? nil : 0

        fimageView.frame = view.bounds
        fimageView.image = UIImage(named: currentPhoto ?? "")

        simageView.frame = view.bounds
        fimageView.isHidden = false
        simageView.isHidden = true

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipe(_:)))
        leftSwipe.direction = .left

        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipe(_:)))
        rightSwipe.direction = .right


        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }

    @objc func viewDidSwipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .right:
            swipeToRight()
        case .left:
            swipeToLeft()
        default:
            break
        }
    }

    func swipeToLeft() {
        guard let nextPhotoIndex = nextPhotoIndex else {
            return
        }

        let hiddenImgeView = hiddenImageView
        let currentImageView = currentImageView

        hiddenImgeView?.image = UIImage(named: photos[nextPhotoIndex])
        hiddenImgeView?.frame.origin.x = view.bounds.maxX
        hiddenImgeView?.isHidden = false

        UIView.animateKeyframes(
            withDuration: 0.9,
            delay: 0,
            options: [],
            animations: {

                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.25,
                    animations: {
                        currentImageView?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    })

                UIView.addKeyframe(
                    withRelativeStartTime: 0.25,
                    relativeDuration: 0.75,
                    animations: {
                        hiddenImgeView?.frame.origin.x = 0
                        currentImageView?.frame.origin.x = -self.view.bounds.width
                    })

            }, completion: { _ in

                self.currentPhotoIndex = nextPhotoIndex
                currentImageView?.isHidden = true
                currentImageView?.transform = .identity

            })

    }

    func swipeToRight() {
        guard let previosPhotoIndex = previousPhotoIndex else {
            return
        }

        let hiddenImgeView = hiddenImageView
        let currentImageView = currentImageView

        hiddenImgeView?.image = UIImage(named: photos[previosPhotoIndex])
        hiddenImgeView?.frame.origin.x = -view.bounds.maxX
        hiddenImgeView?.isHidden = false

        UIView.animateKeyframes(
            withDuration: 0.9,
            delay: 0,
            options: [],
            animations: {

                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.25,
                    animations: {
                        currentImageView?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    })

                UIView.addKeyframe(
                    withRelativeStartTime: 0.25,
                    relativeDuration: 0.75,
                    animations: {
                        hiddenImgeView?.frame.origin.x = 0
                        currentImageView?.frame.origin.x = self.view.bounds.width
                    })

            }, completion: { _ in

                self.currentPhotoIndex = previosPhotoIndex
                currentImageView?.isHidden = true
                currentImageView?.transform = .identity

            })
    }

}
