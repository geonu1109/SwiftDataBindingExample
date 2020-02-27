//
//  ContentView.swift
//  RxSwiftSeminar
//
//  Created by 전건우 on 2020/02/26.
//  Copyright © 2020 Daou Technology Inc. All rights reserved.
//

import SwiftUI
import RxSwift

struct ContentView: View {
    var body: some View {
        TabView {
            SwiftUIScene().tabItem {
                Image(systemName: "sunrise")
                Text("SwiftUI")
            }
            UIKitScene().tabItem {
                Image(systemName: "sunset")
                Text("UIKit")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
