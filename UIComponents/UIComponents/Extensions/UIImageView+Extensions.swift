//
//  UIImageView+Extensions.swift
//  UIComponents
//
//  Created by Celik, Salih on 9.12.2022.
//

import Kingfisher

extension UIImageView {
    
    public func configureKF(url: String?) {
        guard let url = url else { return }
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url), placeholder: nil, options: [.transition(.fade(0.7 ))], progressBlock: nil)
    }
}
