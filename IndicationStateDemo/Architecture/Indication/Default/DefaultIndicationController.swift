//
//  DefaultIndicationController.swift
//  IndicationStateDemo
//
//  Created by Daniil on 30.10.2023.
//

import Foundation

protocol DefaultIndicationController: IndicationController {}

extension DefaultIndicationController {
    func showState(state: IndicationState) {
        switch state {
        case .normal:
            rootView.hideAllViews()
        case .loading:
            rootView.showState(key: state.key)
        case let .error(error):
            guard case let .fullscreen(data) = error.type else {
                return
            }
            rootView.showState(key: state.key, inputData: data)
        case let .empty(data):
            rootView.showState(key: state.key, inputData: data)
        }
    }
}
