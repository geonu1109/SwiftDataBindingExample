//
//  UIKitViewController.swift
//  RxSwiftSeminar
//
//  Created by 전건우 on 2020/02/27.
//  Copyright © 2020 Daou Technology Inc. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class UIKitViewController: UIViewController {
    let viewModel: RxCocoaViewModel = .init()
    
    let disposeBag: DisposeBag = .init()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        let stackView: UIStackView = .init(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        self.view.addSubview(stackView)
        stackView.snp.makeConstraints { (maker) in
            maker.leading.equalToSuperview().offset(20)
            maker.trailing.equalToSuperview().offset(-20)
            maker.centerY.equalToSuperview()
        }
        
        let titleLabel: UILabel = .init(frame: .zero)
        titleLabel.text = "UIKit"
        titleLabel.textAlignment = .center
        stackView.addArrangedSubview(titleLabel)
        
        stackView.addArrangedSubview(self.createSliderRow(title: "Red", valueRelay: self.viewModel.redRelay))
        stackView.addArrangedSubview(self.createSliderRow(title: "Green", valueRelay: self.viewModel.greenRelay))
        stackView.addArrangedSubview(self.createSliderRow(title: "Blue", valueRelay: self.viewModel.blueRelay))
        
        let rect: UIView = .init(frame: .zero)
        stackView.addArrangedSubview(rect)
        rect.snp.makeConstraints { (maker) in
            maker.height.equalTo(400)
        }
        
        Driver.combineLatest(
            self.viewModel.redRelay.asDriver(),
            self.viewModel.greenRelay.asDriver(),
            self.viewModel.blueRelay.asDriver()
        )
            .drive(onNext: { (args) in
                let (red, green, blue) = args
                rect.backgroundColor = UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
            })
            .disposed(by: self.disposeBag)
    }
    
    func createSliderRow(title: String, valueRelay: BehaviorRelay<Double>) -> UIView {
        let view: UIView = .init(frame: .zero)
        view.snp.makeConstraints { (maker) in
            maker.height.equalTo(40)
        }
        
        let titleLabel: UILabel = .init(frame: .zero)
        titleLabel.text = title
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (maker) in
            maker.leading.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
        
        let valueLabel: UILabel = .init(frame: .zero)
        view.addSubview(valueLabel)
        valueLabel.snp.makeConstraints { (maker) in
            maker.centerY.equalToSuperview()
        }
        valueRelay.asDriver().map { String(format: "%0.0f", $0) }
            .drive(valueLabel.rx.text)
            .disposed(by: self.disposeBag)
        
        let slider: UISlider = .init(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 255
        view.addSubview(slider)
        slider.snp.makeConstraints { (maker) in
            maker.width.equalTo(200)
            maker.leading.equalTo(valueLabel.snp.trailing).offset(20)
            maker.trailing.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
        slider.rx.value.asDriver().map { Double($0) }
            .drive(onNext: valueRelay.accept)
            .disposed(by: self.disposeBag)
        
        return view
    }
}
