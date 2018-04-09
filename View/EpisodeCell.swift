//
//  EpisodeCell.swift
//  TestEpisodes
//
//  Created by Mohammad Farhoudi on 08/04/2018.
//  Copyright © 2018 Mohammad Farhoudi. All rights reserved.
//

import UIKit

class EpisodeCell: UICollectionViewCell {
    
//    var episodeDetails = [EpisodeDetails]()
    var epsiodeDetails = [EpisodeDetails]()


    var hasLiked: Bool = false

    var episode: Episode! {
        
        didSet{
            
            episodeTitleLabel.text = episode?.content_type
       
                }
    }
    
    
      var episodeDetails: EpisodeDetails! {
        
        didSet {
                 episodeSynopsisLabel.text = "\(episodeDetails?.title ?? "Episode Category") / \(episodeDetails?.title ?? "Episode Year") / \(episodeDetails?.title ?? "Episode Duration")"

        }
        
    }
    

    
    let episodeImage: UIImageView = {
        let image = UIImageView()
//        image.image = #imageLiteral(resourceName: "appicon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    let episodeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "episodeTitle"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let episodeSynopsisLabel: UILabel = {
        let label = UILabel()
        label.text = "episodeSynopsis"
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        return label
    }()
    
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "HeartEmpty"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleLike), for: .touchUpInside)
        return button
    }()
    
    
    @objc func handleLike() {
        
        activateButton(bool: !hasLiked)
    }
    
    func activateButton(bool: Bool){
        
        hasLiked = bool
        
        let image = bool ? #imageLiteral(resourceName: "HeartFull") : #imageLiteral(resourceName: "HeartEmpty")
        likeButton.setImage(image, for: .normal)
    
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
                
        backgroundColor = UIColor.init(red: 169/255, green: 169/255, blue: 169/255, alpha: 0.7)
        
        addSubview(episodeImage)

        episodeImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        episodeImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        episodeImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        episodeImage.heightAnchor.constraint(equalToConstant: 250).isActive = true



        insertSubview(episodeTitleLabel, aboveSubview: episodeImage)
        episodeTitleLabel.topAnchor.constraint(equalTo: episodeImage.topAnchor, constant: 150).isActive = true
        episodeTitleLabel.leftAnchor.constraint(equalTo: episodeImage.leftAnchor, constant: 20).isActive = true
        episodeTitleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        episodeTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
   
        
        insertSubview(episodeSynopsisLabel, aboveSubview: episodeImage)
        episodeSynopsisLabel.topAnchor.constraint(equalTo: episodeTitleLabel.bottomAnchor, constant: 0).isActive = true
        episodeSynopsisLabel.leftAnchor.constraint(equalTo: episodeImage.leftAnchor, constant: 20).isActive = true
        episodeSynopsisLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        
        insertSubview(likeButton, aboveSubview: episodeImage)
        likeButton.rightAnchor.constraint(equalTo: episodeImage.rightAnchor, constant: -20).isActive = true
        likeButton.topAnchor.constraint(equalTo: episodeImage.topAnchor, constant: 150).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
