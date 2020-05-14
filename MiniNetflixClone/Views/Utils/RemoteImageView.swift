//
//  RemoteImageView.swift
//  MiniNetflixClone
//
//  Created by Sumit on 08/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import SwiftUI

struct RemoteImageView: View {
    @ObservedObject var networkImageVM: NetworkImageVM
    
//    var imageWidth: Int = 130
//    var imageHeight: Int = 175
//    var cornerRadius: Int = 15
    
//    init(imageUrl: String, imageWidth: Int, imageHeight: Int, cornerRadius: Int) {
    init(imageUrl: String, imageWidth: String) {
        let fullPosterUrl = "http://image.tmdb.org/t/p/" + imageWidth + "/" + imageUrl
        self.networkImageVM = NetworkImageVM(imageUrl: fullPosterUrl)
    }
    
    var body: some View {
        Image(uiImage: UIImage(data: self.networkImageVM.data) ?? UIImage(imageLiteralResourceName: "Property_1"))
            .resizable()
//            .frame(width: CGFloat(self.imageWidth), height: CGFloat(self.imageHeight))
//            .cornerRadius(CGFloat(self.cornerRadius))
//            .scaledToFit()
//            .clipped()
    }
}

struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView(imageUrl: "http://image.tmdb.org/t/p/w154/5KCVkau1HEl7ZzfPsKAPM0sMiKc.jpg", imageWidth: "w154")
    }
}
