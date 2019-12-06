//
//  LikeBtn.swift
//  vkontakte
//
//  Created by Администратор on 06.12.2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

class LikeBtnView: UIView {
    var numberLike: Int = 99
    var isLiked: Bool = false
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var likeImg: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(tapOnLikeBtn))
        self.addGestureRecognizer(tapAction)
    }

    @objc func tapOnLikeBtn() {
        if !isLiked {
            numberLike += 1
            likeLabel.textColor = UIColor.red
            likeImg.tintColor = UIColor.red
        } else {
            numberLike -= 1
            likeLabel.textColor = UIColor.label
            likeImg.tintColor = UIColor.label
        }
        likeLabel.text = String(numberLike)
        isLiked = !isLiked
    }
}
