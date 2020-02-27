//
//  SwiftUIScene.swift
//  RxSwiftSeminar
//
//  Created by 전건우 on 2020/02/26.
//  Copyright © 2020 Daou Technology Inc. All rights reserved.
//

import SwiftUI

struct SwiftUIScene: View {
    @ObservedObject var viewModel: CombineViewModel = .init()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("SwiftUI")
            self.createSliderRow(title: "Red", target: self.$viewModel.red)
            self.createSliderRow(title: "Green", target: self.$viewModel.green)
            self.createSliderRow(title: "Blue", target: self.$viewModel.blue)
            Rectangle()
                .frame(width: nil, height: 400, alignment: .center)
                .foregroundColor(.init(red: self.viewModel.red / 255, green: self.viewModel.green / 255, blue: self.viewModel.blue / 255))
        }.padding([.leading, .trailing], 20)
    }
    
    func createSliderRow(title: String, target: Binding<Double>) -> some View {
        return HStack(spacing: 20) {
            HStack(spacing: 0) {
                Text(title)
                Spacer()
                Text(String(format: "%0.0f", target.wrappedValue))
            }
            Slider(value: target, in: 0 ... 255)
                .frame(width: 200, height: 40, alignment: .center)
        }
    }
}

struct SwiftUIScene_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIScene()
    }
}
