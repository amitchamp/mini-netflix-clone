//
//  MovieCategoryView.swift
//  MiniNetflixClone
//
//  Created by Sumit on 13/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import SwiftUI

struct MovieCategoryView: View {
    var body: some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ZStack {
                    Image("Property_1")
                        .resizable()
                        .frame(width: 150, height: 70)
                        .cornerRadius(10)
                        .scaledToFit()
                        .clipped()
                    
                    Rectangle()
                        .frame(width: 150, height: 70)
                        .foregroundColor(.clear)
                        .background(Color("DarkRed"))
                        .cornerRadius(10)
                        .opacity(0.8)
                        .clipped()
                    
                    Text("Action")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .bold()
                }
                
                ZStack {
                    Image("Property_1")
                        .resizable()
                        .frame(width: 150, height: 70)
                        .cornerRadius(10)
                        .scaledToFit()
                        .clipped()
                    
                    Rectangle()
                        .frame(width: 150, height: 70)
                        .foregroundColor(.clear)
                        .background(Color("DarkRed"))
                        .cornerRadius(10)
                        .opacity(0.8)
                        .clipped()
                    
                    Text("Adventure")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .bold()
                }
                
                ZStack {
                    Image("Property_1")
                        .resizable()
                        .frame(width: 150, height: 70)
                        .cornerRadius(10)
                        .scaledToFit()
                        .clipped()
                    
                    Rectangle()
                        .frame(width: 150, height: 70)
                        .foregroundColor(.clear)
                        .background(Color("DarkRed"))
                        .cornerRadius(10)
                        .opacity(0.8)
                        .clipped()
                    
                    Text("Comedy")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .bold()
                }
                
                ZStack {
                    Image("Property_1")
                        .resizable()
                        .frame(width: 150, height: 70)
                        .cornerRadius(10)
                        .scaledToFit()
                        .clipped()
                    
                    Rectangle()
                        .frame(width: 150, height: 70)
                        .foregroundColor(.clear)
                        .background(Color("DarkRed"))
                        .cornerRadius(10)
                        .opacity(0.8)
                        .clipped()
                    
                    Text("Horror")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .bold()
                }
            }
        }
    }
}

struct MovieCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCategoryView()
    }
}
