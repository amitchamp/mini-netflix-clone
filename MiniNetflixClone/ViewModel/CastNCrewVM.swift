//
//  CastNCrewVM.swift
//  MiniNetflixClone
//
//  Created by Sumit on 13/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import Foundation
import Combine

class CastNCrewVM: ObservableObject {
    
    @Published var castNCrew: CastList?
    
    func getCastNCrew(url: String) {
        self.downloadCastNCrew(url: Constant.getNetwokUrl(endPoint: url))
    }
    
    private func downloadCastNCrew(url: String) {
        CastNCrewsServices.getCastNCrew(url: url) { (castNCrewData) in
            if let castNCrewData = castNCrewData {
                DispatchQueue.main.async {
                    self.castNCrew = castNCrewData
                }
            }
        }
    }
}
