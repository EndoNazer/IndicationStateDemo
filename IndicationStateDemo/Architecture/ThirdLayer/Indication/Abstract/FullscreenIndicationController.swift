//
//  FullscreenIndicationController.swift
//  IndicationStateDemo
//
//  Created by Daniil on 30.10.2023.
//

import UIKit

protocol FullscreenIndicationController: FullscreenHandler {
    associatedtype View: FullscreenIndicationView

    var rootView: View { get }
}

extension FullscreenIndicationController {
    func handleState(_ state: FullscreenState) {
        switch state {
        case .loading:
            rootView.showState(key: FullscreenIndicationKey.loadingKey)
        case let .error(data):
            rootView.showState(key: FullscreenIndicationKey.errorKey, inputData: data)
        case let .empty(data):
            rootView.showState(key: FullscreenIndicationKey.emptyKey, inputData: data)
        case .hidden:
            rootView.hideAllViews()
        }
    }
}
