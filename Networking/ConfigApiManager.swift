//
//  ConfigApiManager.swift
//  TestEpisodes
//
//  Created by Mohammad Farhoudi on 08/04/2018.
//  Copyright © 2018 Mohammad Farhoudi. All rights reserved.
//

import UIKit
import Alamofire


class ConfigApiManager: NSObject {
    
    static let sharedIntance = ConfigApiManager()

    
    func fetchEpisodeDetails(content_URL: String, completionHandler: @escaping ([EpisodeDetails]) -> ()) {
        
        var jsonUrlString: String?
        
        if content_URL.contains("dividers") {
            
            jsonUrlString = "http://feature-code-test.skylark-cms.qa.aws.ostmodern.co.uk:8000" + content_URL
        } else {
            
            jsonUrlString = "http://feature-code-test.skylark-cms.qa.aws.ostmodern.co.uk:8000" + content_URL + "items/"
        }
        
      
        guard let url = URL(string: jsonUrlString ?? "") else {return}
        let headers = [
            "Content-Type": "application/json"
        ]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseString { (dataResponse) in
            if let err = dataResponse.error{
                print("Failed to contact skylark", err)
            }
            
            guard let responseString = dataResponse.result.value else {
                print("ERROR: didn't get a string in the response")
                return
            }
//
//            let leadingCharactersToTrim = CharacterSet(charactersIn: "/").union(.whitespacesAndNewlines)
//            let trimmedString = responseString.trimmingCharacters(in: leadingCharactersToTrim)
//            let finalData = trimmedString.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
//            guard let data = finalData.data(using: .utf8) else {return}
            
            guard let data = dataResponse.data else {return}


            do {
                
                if JSONSerialization.isValidJSONObject(data) {
                    print("Valid Json")
                } else {
                    print("InValid Json")
                }
                
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                print(json)
                guard let episodeDetailDictionaries = json as? [[String: Any]] else {return}
                
                var episodeDetails = [EpisodeDetails]()
                
                for episodeDetailDictionary in episodeDetailDictionaries {
                    
                    let episodeDetail = EpisodeDetails(dictionary: episodeDetailDictionary)
                    episodeDetails.append(episodeDetail)
                }
                
                DispatchQueue.main.async {
                    
                    completionHandler(episodeDetails)
                }
                
                
            } catch let jsonError {
                print("Failed to parse JSON properly:", jsonError)
                
            }
            
        }
        
    }

    
    func fetchEpisodes(completionHandler: @escaping ([Episode]) -> ()) {

        let url = "http://feature-code-test.skylark-cms.qa.aws.ostmodern.co.uk:8000/api/sets/coll_e8400ca3aebb4f70baf74a81aefd5a78/items/"

    Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
    
    if let err = dataResponse.error{
    print("Failed to contact skylark", err)
    }
    
    guard let data = dataResponse.data else{return}
    
    do {
    let homeSetOutput = try JSONDecoder().decode(HomeOutput.self, from: data)
        
        completionHandler(homeSetOutput.objects)
        
    
    } catch let decodeError {
    print("Failed to parse JSON properly:", decodeError)
    }
    
    
}
}
}
