//
//  NetworkImageVM.swift
//  MiniNetflixClone
//
//  Created by Sumit on 08/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import Foundation
import Combine

class NetworkImageVM: ObservableObject {
    @Published var data = Data()
    
    var imageUrl: String = ""

    init(imageUrl: String) {
        self.imageUrl = imageUrl
        
        if !self.imageUrl.isEmpty {
            downloadNetworkImage()
        }
    }
    
    private func downloadNetworkImage() {
        RemoteImageService.downloadRemoteImage(imageUrl: self.imageUrl) { imageData in
            if let imageData = imageData {
                DispatchQueue.main.async {
                    self.data = imageData
                }
            }
        }
    }
}
