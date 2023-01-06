//
//  PostCollectionViewCell.swift
//  CatstaGram
//
//  Created by 김동현 on 2022/12/30.
//

import UIKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setupData(_ imageURLStr: String?) {
        // 이미지뷰의 이미지를 업로드한다.
        guard let imageURLString = imageURLStr else { return }
        if let url = URL(string: imageURLString) {
            postImageView.kf.setImage(with: url,
                                      placeholder: UIImage(systemName: "photo")
            )
        }
    }
}
