//
//  CastNCrewView.swift
//  MiniNetflixClone
//
//  Created by Sumit on 14/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import SwiftUI

struct CastNCrewView: View {
    
    let castNCrewList: CastList

    var body: some View {
        let castPosterUrls = self.getPosterUrl(cast: self.castNCrewList.cast)
        let crewPosterUrls = self.getPosterUrl(cast: self.castNCrewList.crew)
        
        return VStack {
            HImageSVView(tag: 0, title: "Cast", posterDetils: castPosterUrls)
                .padding(.top, 30)

            HImageSVView(tag: 0, title: "Crew", posterDetils: crewPosterUrls)
                .padding(.top, 30)

        }
        .padding(.top, 20)
    }
    
    private func getPosterUrl(cast: [Cast]) -> [PosterRedirect] {
        var posterImageUrls: [PosterRedirect] = [PosterRedirect]()

        for castDetail in cast {
            if castDetail.profile_path != nil {
                posterImageUrls.append(PosterRedirect(posterUrl: castDetail.profile_path!, pageDetailId: nil))
            }
        }
        
        return posterImageUrls
    }
}

struct CastNCrewView_Previews: PreviewProvider {
    static var previews: some View {
        CastNCrewView(castNCrewList: CastList(id: 1, cast: [], crew: []))
    }
}
