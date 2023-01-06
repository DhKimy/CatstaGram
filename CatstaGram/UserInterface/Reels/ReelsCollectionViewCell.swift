//
//  ReelsCollectionViewCell.swift
//  CatstaGram
//
//  Created by 김동현 on 2023/01/06.
//

import UIKit
import SnapKit
import AVKit

// UiNib을 사용하지 않고, 코드로 cell을 구성하는 방법
class ReelsCollectionViewCell: UICollectionViewCell {
    static let identifier = "ReelsCollectionViewCell"
    
    var videoView: VideoPlayerView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:)가 구현되지 않았습니다.")
    }
    
    public func setupURL(_ urlStr: String) {
        self.videoView = VideoPlayerView(frame: .zero, urlStr: urlStr)
        setupAttribute()
        setupLayout()
    }
    
    private func setupAttribute() {
        
    }
    
    private func setupLayout() {
        guard let videoView = videoView else { return }
        contentView.addSubview(videoView)
        videoView.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
    }
}
