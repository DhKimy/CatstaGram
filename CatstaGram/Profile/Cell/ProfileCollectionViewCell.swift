//
//  ProfileCollectionViewCell.swift
//  CatstaGram
//
//  Created by 김동현 on 2022/12/30.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileAddImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var editFriendButton: UIButton!
    @IBOutlet weak var labelPostingCount: UILabel!
    @IBOutlet weak var labelFollower: UILabel!
    @IBOutlet weak var labelFollowing: UILabel!
    
    static let identifier = "ProfileCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
        // Initialization code
    }
    
    private func setupAttribute() {
        profileImageView.layer.cornerRadius = 44
        profileAddImageView.layer.cornerRadius = 12
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        editFriendButton.layer.cornerRadius = 3
        editFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        editFriendButton.layer.borderWidth = 1
        
        [labelPostingCount, labelFollower, labelFollowing].forEach({ $0.text = "\(Int.random(in: 0 ... 100))" })
    }

}
