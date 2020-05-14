//
//  NetworkImage.swift
//  MiniNetflixClone
//
//  Created by Sumit on 07/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import Foundation
import Combine

class NetworkImage: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error != nil else { return }
            
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
