//
//  DefaultIndicationView.swift
//  IndicationStateDemo
//
//  Created by Daniil on 30.10.2023.
//

import UIKit

protocol DefaultFullscreenIndicationView: FullscreenIndicationView {
    func registrateDefaultStateViews()
}

extension DefaultFullscreenIndicationView {
    func registrateDefaultStateViews() {
        registrate(key: FullscreenIndicationKey.loadingKey) {
            DefaultFullscreenLoadingView()
        }

        registrate(key: FullscreenIndicationKey.emptyKey) { (inputData: FullscreenEmptyModel) -> UIView in
            let view = DefaultFullscreenEmptyView()
            view.update(data: inputData)
            return view
        }

        registrate(key: FullscreenIndicationKey.errorKey) { (inputData: FullscreenErrorModel) -> UIView in
            let view = DefaultFullscreenErrorView()
            view.updateWith(data: inputData)
            return view
        }
    }
}
