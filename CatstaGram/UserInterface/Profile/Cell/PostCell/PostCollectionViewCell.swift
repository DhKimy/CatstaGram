//
//  PostCollectionViewCell.swift
//  CatstaGram
//
//  Created by 김동현 on 2022/12/30.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setupData(_ data: UIImage) {
        // 이미지뷰의 이미지를 업로드한다.
        
    }
}
