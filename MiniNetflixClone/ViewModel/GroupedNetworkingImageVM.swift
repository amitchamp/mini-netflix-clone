//
//  GroupedNetworkingImageVM.swift
//  MiniNetflixClone
//
//  Created by Sumit on 13/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import Foundation
import Combine

class GroupedNetworkingImageVM: ObservableObject {
    @Published var imagesData = [Data]()
    
    var imagesUrlPath: [String] = [String]()
    
    init(imagesUrl: [String]) {
        self.imagesUrlPath = imagesUrl
        
        if !self.imagesUrlPath.isEmpty {
            downloadImages()
        }
    }
    
    func imageDownloadByUrl(imagesUrl: [String]) {
        self.imagesUrlPath = imagesUrl
        
        if !self.imagesUrlPath.isEmpty {
            downloadImages()
        }
    }
    
    private func downloadImages() {
        RemoteImageService.downloadGroupedRemoteImage(imagesUrl: self.imagesUrlPath) { (imageData) in
            if let imageData = imageData {
                DispatchQueue.main.async {
                    self.imagesData = imageData
                }
            }
        }
    }
}
