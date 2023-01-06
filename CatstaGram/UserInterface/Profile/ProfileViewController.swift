//
//  ProfileViewController.swift
//  CatstaGram
//
//  Created by 김동현 on 2022/12/30.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {

    // MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    var userPosts: [GetUserPosts]? {
        // API를 view를 그리고 나서 받아오기 때문에 한 번 더 view를 받아온다.
        didSet { self.profileCollectionView.reloadData() }
    }
    var deletedIndex: Int?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        // Do any additional setup after loading the view.
        setUpData()
    }
    
    // MARK: Actions
    @objc func didLongPressCell(_ gestureRecognizer: UILongPressGestureRecognizer) {
        // 버그를 막기위한 방어용 코드
        if gestureRecognizer.state != .began { return }
        
        // 클릭한 위치를 구한다.
        let position = gestureRecognizer.location(in: profileCollectionView)
        if let indexPath = profileCollectionView.indexPathForItem(at: position) {
            print("debug: ", indexPath.item)
            // 삭제 API 기능
            
            guard let userPosts = self.userPosts else { return }
            let cellData = userPosts[indexPath.item]
            self.deletedIndex = indexPath.item
            if let postIdx = cellData.postIdx {
                UserFeedDataManager().deleteUserFeed(self, postIdx)
            }
        }
    }
    
    // MARK: Helpers
    private func setupCollectionView() {
        // delegate 연결
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        // cell 등록
        profileCollectionView.register(
            UINib(
                nibName: "ProfileCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier
        )
        profileCollectionView.register(
            UINib(
                nibName: "PostCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: PostCollectionViewCell.identifier
        )
        
        // 길게 누르면 반응하는 기능을 위한 부분
        let gesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(didLongPressCell)
            )
        gesture.minimumPressDuration = 0.66
        gesture.delegate = self
        gesture.delaysTouchesBegan = true
        profileCollectionView.addGestureRecognizer(gesture)
        
        profileCollectionView.reloadData()
    }
    
    private func setUpData() {
        UserFeedDataManager().getUserFeed(self)
    }

}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return userPosts?.count ?? 0 // 게시물 개수와 동일하게 세팅
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        
        switch section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else { return UICollectionViewCell() }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else { return UICollectionViewCell() }
            let itemIndex = indexPath.item
            if let cellData = self.userPosts {
                // 데이터가 있는 경우 셀에 데이터를 전달한다.
                cell.setupData(cellData[itemIndex].postImgUrl)
            }
            
            return cell
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        
        switch section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 160)
        default:
            let side = CGFloat((collectionView.frame.width / 3) - (4/3))
            return CGSize(width: side, height: side)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
    
}

// MARK: - API 통신 메서드
extension ProfileViewController {
    func successFeedAPI(_ result: UserFeedModel) {
        self.userPosts = result.result?.getUserPosts
    }
    
    func successDeletePostAPI(_ isSuccess: Bool) {
        guard isSuccess else { return }
        if let deletedIndex = self.deletedIndex {
            self.userPosts?.remove(at: deletedIndex)
        }
    }
}
