//
//  ViewControllerRepresenter.swift
//  RxSwiftSeminar
//
//  Created by 전건우 on 2020/02/26.
//  Copyright © 2020 Daou Technology Inc. All rights reserved.
//

import SwiftUI

protocol UIViewControllerRepresenter: UIViewControllerRepresentable {
    var uiViewController: UIViewControllerType { get }
}

extension UIViewControllerRepresenter {
    func makeUIViewController(context: Context) -> UIViewControllerType {
        return self.uiViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        return
    }
}
