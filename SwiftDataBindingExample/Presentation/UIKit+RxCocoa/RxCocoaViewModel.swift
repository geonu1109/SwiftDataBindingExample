//
//  RxCocoaViewModel.swift
//  RxSwiftSeminar
//
//  Created by 전건우 on 2020/02/26.
//  Copyright © 2020 Daou Technology Inc. All rights reserved.
//

import RxCocoa

class RxCocoaViewModel: Presenter {
    let redRelay: BehaviorRelay<Double> = .init(value: .zero)
    let greenRelay: BehaviorRelay<Double> = .init(value: .zero)
    let blueRelay: BehaviorRelay<Double> = .init(value: .zero)
}
