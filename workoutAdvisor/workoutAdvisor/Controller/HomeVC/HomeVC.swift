//
//  ViewController.swift
//  workoutAdvisor
//
//  Created by Khawaja Abdul Haleem on 07/07/2023.
//

import UIKit


class HomeVC: UIViewController {
    
    @IBOutlet weak var navBar: NavBar!
    @IBOutlet weak var videosCollectionView: UICollectionView!
    
    var viewModel = HomeVcVm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//                let url = URL(string: videoURL)
//                self.getThumbnailFromImage(url: url!) { image in
//                    self.thumbnailImage.image = image
//                }
        
        initialSetup()
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StringConstant.SEGUE_TO_PLAYERVC {
            if let nextViewController = segue.destination as? PlayerVC {
                nextViewController.viewModel.image = viewModel.videoThumbnail
                nextViewController.viewModel.title = viewModel.videoTitle
            }
        }
    }

    private func initialSetup() {
        navBar.delegate = self
        
        setupCollectionView()
        
        StringConstant.getThumbNailFromAsset(video: viewModel.video) { image in
            self.viewModel.videoThumbnail = image
        }
    }
    
    private func setupCollectionView() {
        videosCollectionView.collectionViewLayout = createCompositionalLayout()
        
        videosCollectionView.registerNib(cell: videoTagsCVC.self)
        videosCollectionView.registerNib(cell: DescriptionCVC.self)
        videosCollectionView.registerNib(cell: ButtonCVC.self)
        videosCollectionView.registerNib(cell: TitleCVC.self)
        videosCollectionView.registerNib(cell: VideoCVC.self)
        videosCollectionView.register(header: VideoPlayerView.self)
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnv: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            if sectionIndex == 0 {
                return AppLayouts.shared.compositionalLayoutVertical(scrollingType: .vertical)
            } else if sectionIndex == 4 {
                return AppLayouts.shared.trendingVideosSectionLayout()
            } else {
                return AppLayouts.shared.compositionalLayoutVertical(scrollingType: .normal)
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 0
        layout.configuration = config
        
        return layout
    }
}
    
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        videoCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch videoCollection[section] {
        case .tags(let data):
            return data.count
        case .title, .button(_), .description(_):
            return 1
        case .videos(let data):
            return data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header: VideoPlayerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, forIndexPath: indexPath)
        header.delegate = self
        viewModel.videoTitle = header.videoTitle.text ?? "No Title"
        header.videoDuration.text = StringConstant.getVideoDuration(video: viewModel.video)
        header.imageThumbnail.image = viewModel.videoThumbnail
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch videoCollection[indexPath.section] {
            
        case .tags(let data):
            let tagsCVC: videoTagsCVC = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            tagsCVC.videoTags.text = data[indexPath.item]
          
            return tagsCVC
            
        case .description(let description):
            let descriptionCell: DescriptionCVC = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            descriptionCell.videoDescription.text = description
           
            return descriptionCell
            
        case .button:
            let buttonCell: ButtonCVC = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            buttonCell.delegate = self
            return buttonCell
            
        case .title(let title):
            let titleCell: TitleCVC = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            titleCell.titleLabel.text = title
            
            return titleCell
            
        case .videos:
            let videoCell: VideoCVC = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            return videoCell
        }
    }
}

extension HomeVC: VPViewProtocol {
    func shareBtnTapped() { }
    
    func playBtnTapped() {
        performSegue(withIdentifier: StringConstant.SEGUE_TO_PLAYERVC, sender: nil)
    }
    
    func favBtnTapped() { }
}

extension HomeVC: NavBarProtocol {
    func menuBtnTapped() { }
    
    func ccBtnTapped() { }
    
    func backBtnTapped() { navigationController?.popViewController(animated: true) }
}

extension HomeVC: ButtonCVCProtocol {
    func workoutBtnTapped() {
        performSegue(withIdentifier: StringConstant.SEGUE_TO_PLAYERVC, sender: nil)
    }
}
