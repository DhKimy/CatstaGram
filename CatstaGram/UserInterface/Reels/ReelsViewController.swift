//
//  ReelsViewController.swift
//  CatstaGram
//
//  Created by 김동현 on 2023/01/06.
//

import UIKit

class ReelsViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    private var nowPage = 0
    
    private let videoURLStrArray = ["dummy", "dummy2"]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    
    
    // MARK: - Helpers
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast
        collectionView.register(
            ReelsCollectionViewCell.self,
            forCellWithReuseIdentifier: ReelsCollectionViewCell.identifier)
        
        starLoop()
    }
    
    private func starLoop() {
        let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            self.moveNextPage()
        }
    }
    
    private func moveNextPage() {
        let itemCount = collectionView.numberOfItems(inSection: 0)
        
        nowPage += 1
        if nowPage >= itemCount {
            nowPage = 0
        }
        
        collectionView.scrollToItem(at: IndexPath(item: nowPage, section: 0), at: .centeredVertically, animated: true)
        
    }
}


extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelsCollectionViewCell.identifier, for: indexPath) as? ReelsCollectionViewCell else { fatalError() }
        cell.setupURL(videoURLStrArray.randomElement()!)
        return cell
    }
    
    // 지나간 릴스의 영상을 재생하지 않기 위한 부분
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ReelsCollectionViewCell {
            cell.videoView?.cleanup()
        }
    }
}

extension ReelsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.width,
            height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}
