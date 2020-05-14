//
//  RemoteImageService.swift
//  MiniNetflixClone
//
//  Created by Sumit on 08/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import Foundation

class RemoteImageService {
    
    static func downloadRemoteImage(imageUrl: String, completion: @escaping (Data?) -> ()) {
        guard let url = URL(string: imageUrl) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, respone, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(data)
        }.resume()
    }
    
    static func downloadGroupedRemoteImage(imagesUrl: [String], completion: @escaping ([Data]?) -> ()) {
        let totalImages = imagesUrl.count
        var imagesData = [Data]()

        if totalImages > 0 {
            for (index, url) in imagesUrl.enumerated() {
                guard let url = URL(string: url) else {
                    completion(nil)
                    return
                }
                
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else {
                        completion(nil)
                        return
                    }

                    imagesData.append(data)
                    
                    if totalImages == index + 1 {
                        completion(imagesData)
                        return
                    }
                }.resume()
            }
        }

        completion(nil)
        return
    }
}
