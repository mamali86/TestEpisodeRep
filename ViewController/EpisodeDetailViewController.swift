//
//  EpisodeDetailViewController.swift
//  TestEpisodes
//
//  Created by Mohammad Farhoudi on 0/04/2018.
//  Copyright © 2018 Mohammad Farhoudi. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    
    let episodeImage: UIImageView = {
        let image = UIImageView()
//        image.image = #imageLiteral(resourceName: "appicon")
        image.backgroundColor = UIColor.init(red: 169/255, green: 169/255, blue: 169/255, alpha: 0.7)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    let episodeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "episodeTitle"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let episodeSynopsisLabel: UILabel = {
        let label = UILabel()
        label.text = "episodeSynopsis"
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .lightGray
        return label
    }()
    
    
    var episode: Episode? {
        didSet{
            navigationItem.title = "Epiosde Details"
            episodeTitleLabel.text = episode?.content_type
            episodeSynopsisLabel.text = "\(episode?.heading ?? "Episode Category") / \(episode?.heading ?? "Episode Year") / \(episode?.heading ?? "Episode Duration")"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
        
        
        view.backgroundColor = .white
        
        
        view.addSubview(episodeImage)
        
        episodeImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        episodeImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        episodeImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        episodeImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        
        view.addSubview(episodeTitleLabel)
        episodeTitleLabel.topAnchor.constraint(equalTo: episodeImage.bottomAnchor, constant: 10).isActive = true
        episodeTitleLabel.leftAnchor.constraint(equalTo: episodeImage.leftAnchor, constant: 20).isActive = true
        episodeTitleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        episodeTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        view.addSubview(episodeSynopsisLabel)
        episodeSynopsisLabel.topAnchor.constraint(equalTo: episodeTitleLabel.bottomAnchor, constant: 0).isActive = true
        episodeSynopsisLabel.leftAnchor.constraint(equalTo: episodeImage.leftAnchor, constant: 20).isActive = true
        episodeSynopsisLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        

    }
    
}
