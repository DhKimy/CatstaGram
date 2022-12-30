//
//  FeedTableViewCell.swift
//  CatstaGram
//
//  Created by 김동현 on 2022/12/30.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewUserProfile: UIImageView!
    @IBOutlet weak var labelUsername: UIView!
    @IBOutlet weak var imageViewFeed: UIImageView!
    @IBOutlet weak var buttonIsLike: UIButton!
    @IBOutlet weak var labelHowManyLike: UILabel!
    @IBOutlet weak var buttonIsBookMark: UIButton!
    @IBOutlet weak var labelFeed: UILabel!
    @IBOutlet weak var imageViewMyProfile: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true // 내부 이미지도 같이 cornerRadius 적용(자르기)
        imageViewMyProfile.layer.cornerRadius = 22.5
        imageViewMyProfile.clipsToBounds = true
        
        let fontSize = UIFont.boldSystemFont(ofSize: 9)
        let attributeStr = NSMutableAttributedString(string: labelFeed.text ?? "")
        attributeStr.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 3))
        
        labelFeed.attributedText = attributeStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func actionIsLikeSelected(_ sender: UIButton) {
        buttonIsLike.isSelected = buttonIsLike.isSelected ? false : true
    }
    
    @IBAction func actionIsBookMarkSelected(_ sender: UIButton) {
        buttonIsBookMark.isSelected = buttonIsBookMark.isSelected ? false : true
    }
    
    
}
