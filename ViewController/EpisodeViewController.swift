//
//  ViewController.swift
//  TestEpisodes
//
//  Created by Mohammad Farhoudi on 08/04/2018.
//  Copyright © 2018 Mohammad Farhoudi. All rights reserved.
//

import UIKit
import Alamofire


class EpisodeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellID = "cellID"
    var episodes = [Episode]()
    var epsiodeDetails = [EpisodeDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        collectionView?.register(EpisodeCell.self, forCellWithReuseIdentifier: cellID)
        setupEpisodes()
    }
    
    
    fileprivate func setupEpisodes(){
    
        ConfigApiManager.sharedIntance.fetchEpisodes { (episodes) in
            DispatchQueue.main.async {

            self.episodes = episodes
            self.collectionView?.reloadData()
        }
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 210)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! EpisodeCell
         cell.episode = self.episodes[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedEpisode = self.episodes[indexPath.row]
        let episodeDetailViewController = EpisodeDetailViewController()
        episodeDetailViewController.episode = selectedEpisode
        navigationController?.pushViewController(episodeDetailViewController, animated: true)
        
        
    }

}

