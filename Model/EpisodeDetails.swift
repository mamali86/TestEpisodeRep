//
//  EpisodeDetails.swift
//  TestEpisodes
//
//  Created by Mohammad Farhoudi on 08/04/2018.
//  Copyright © 2018 Mohammad Farhoudi. All rights reserved.
//

import Foundation



class EpisodeDetails {
    
    var title: String?
//    var language_modified_by: NSNumber?
//    var number_of_views: NSNumber?
//    var date: NSDate?
//    var duration: NSNumber?
    
    
    init(dictionary :[String: Any]) {
        
        self.title = dictionary["account_url"] as? String ?? "Episode Title"
//        self.language_modified_by = dictionary["language_modified_by"] as? String ?? ""
//        self.number_of_views = dictionary["number_of_views"] as? NSNumber
    }

}


