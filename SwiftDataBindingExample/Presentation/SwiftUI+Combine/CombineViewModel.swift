//
//  CombineViewModel.swift
//  RxSwiftSeminar
//
//  Created by 전건우 on 2020/02/26.
//  Copyright © 2020 Daou Technology Inc. All rights reserved.
//

import Combine

class CombineViewModel: ObservableObject, Presenter {
    @Published var red: Double = .zero
    @Published var green: Double = .zero
    @Published var blue: Double = .zero
}
