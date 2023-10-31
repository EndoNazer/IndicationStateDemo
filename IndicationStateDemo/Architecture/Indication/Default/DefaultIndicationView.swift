//
//  DefaultIndicationView.swift
//  IndicationStateDemo
//
//  Created by Daniil on 30.10.2023.
//

import UIKit

protocol DefaultIndicationView: IndicationView {
    func registrateDefaultStateViews()
}

extension DefaultIndicationView {
    func registrateDefaultStateViews() {
        registrate(key: IndicationState.loadingKey) {
            DefaultLoadingView()
        }

        registrate(key: IndicationState.emptyKey) { (inputData: DefaultEmptyModel) -> UIView in
            let view = DefaultEmptyView()
            view.update(data: inputData)
            return view
        }

        registrate(key: IndicationState.errorKey) { (inputData: FullscreenError) -> UIView in
            let view = DefaultErrorView()
            view.updateWith(data: inputData)
            return view
        }
    }
}
