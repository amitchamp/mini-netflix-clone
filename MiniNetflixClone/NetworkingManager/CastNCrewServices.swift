//
//  CastNCrewServices.swift
//  MiniNetflixClone
//
//  Created by Sumit on 13/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import Foundation

class CastNCrewsServices {
    static func getCastNCrew(url: String, completion: @escaping (CastList?) -> ()) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let castNCrewResponse = try? JSONDecoder().decode(CastList.self, from: data)

            if let castNCrewListResponse = castNCrewResponse {
                completion(castNCrewListResponse)
                return
            }
            
            completion(nil)
            return
        }.resume()
    }
}
