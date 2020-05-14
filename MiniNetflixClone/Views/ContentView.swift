//
//  ContentView.swift
//  MiniNetflixClone
//
//  Created by Sumit on 07/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
    }

    
    var body: some View {
        HomepageScreenView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
