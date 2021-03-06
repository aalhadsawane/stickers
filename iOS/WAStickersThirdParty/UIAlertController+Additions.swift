//
// Copyright (c) WhatsApp Inc. and its affiliates.
// All rights reserved.
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.
//

import UIKit

extension UIAlertController {
    func addSpinner() {
        let activity: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)
        view.addSubview(activity)

        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.addConstraint(NSLayoutConstraint(item: activity, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: activity.bounds.size.width))
        activity.addConstraint(NSLayoutConstraint(item: activity, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: activity.bounds.size.height))
        view.addConstraint(NSLayoutConstraint(item: activity, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: activity, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1.0, constant: -20.0))

        activity.startAnimating()
    }

    func addImageView(withImage image: UIImage, animated: Bool) {
        var stickerImageViewLength: CGFloat = 100.0
        if #available(iOS 9.0, *) {
            stickerImageViewLength = 125
        }

        let stickerImageView: UIImageView = UIImageView(image: image)
        stickerImageView.translatesAutoresizingMaskIntoConstraints = false

        if animated {
            if let images = image.images {
                stickerImageView.animationImages = images
                stickerImageView.animationDuration = image.duration

                stickerImageView.layer.speed = 1.0
                stickerImageView.layer.timeOffset = 0.0
                stickerImageView.layer.beginTime = 0.0

                let animation = QuartzCore.CAKeyframeAnimation(keyPath:"contents")
                let values: [CGImage] = images.compactMap { $0.cgImage }
                animation.values = values
                animation.calculationMode = .discrete
                animation.duration = image.duration
                animation.repeatCount = .greatestFiniteMagnitude
                animation.isRemovedOnCompletion = false
                stickerImageView.layer.add(animation, forKey: "StickerAnimation")
            }
        }

        view.addSubview(stickerImageView)

        stickerImageView.addConstraint(NSLayoutConstraint(item: stickerImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: stickerImageViewLength))
        stickerImageView.addConstraint(NSLayoutConstraint(item: stickerImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: stickerImageViewLength))
        view.addConstraint(NSLayoutConstraint(item: stickerImageView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 10.0))
        view.addConstraint(NSLayoutConstraint(item: stickerImageView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
    }
}
