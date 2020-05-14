//
//  StarRating.swift
//  MiniNetflixClone
//
//  Created by Sumit on 13/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import SwiftUI

struct StarRating: View {
    
    let rating: Float

    var body: some View {
        let roundedNumber = Int(rating.rounded())

        return HStack(alignment: .center, spacing: 2) {
            ForEach(1..<6) { number in
                Image(systemName: roundedNumber >= number ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(Color("DarkRed"))
            }
        }
    }
}

struct StarRating_Previews: PreviewProvider {
    static var previews: some View {
        StarRating(rating: 10.0)
    }
}
