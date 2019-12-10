//
//  LikeButton.swift
//  vkontakte
//
//  Created by Администратор on 06.12.2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class LikeButton: UIButton {
    var likeCount = 99
     var isLiked: Bool = false {
        didSet {
            if isLiked {
                setLike()
            } else {
                unsetLike()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDefault()
    }
    
    func like() {
        isLiked = !isLiked
    }
    
    private func setupDefault() {
        setTitle(String(describing: likeCount), for: .normal)
        tintColor = .label
        setTitleColor(.label, for: .normal)
    }
    
    private func setLike() {
        likeCount += 1
        setTitle(String(describing: likeCount), for: .normal)
        tintColor = .red
        setTitleColor(.red, for: .normal)
    }
    
    private func unsetLike() {
        likeCount -= 1
        setTitle(String(describing: likeCount), for: .normal)
        tintColor = .label
        setTitleColor(.label, for: .normal)
    }
}
