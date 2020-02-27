//
//  UIKitScene.swift
//  RxSwiftSeminar
//
//  Created by 전건우 on 2020/02/26.
//  Copyright © 2020 Daou Technology Inc. All rights reserved.
//

import UIKit

struct UIKitScene: UIViewControllerRepresenter {
    typealias UIViewControllerType = UIKitViewController
    
    let uiViewController: UIKitViewController = .init()
}
