//
//  IndicationStateHandler.swift
//  ErrorsTest
//
//  Created by Daniil on 27.10.2023.
//

import Foundation

protocol IndicationStateHandler {
    var fullscreenDisplayer: FullscreenIndicationDisplayer { get }
    var toastManager: ToastDisplayer { get }
    var customStateHandler: CustomIndicationStateDisplayer? { get }

    func setState(_ state: IndicationState)
}

extension IndicationStateHandler {
    // Первичная обработка и развод события
    func setState(_ state: IndicationState) {
        switch state {
        case .normal:
            fullscreenDisplayer.hideAll()
            toastManager.hideAll()
            customStateHandler?.hideAll()
        case .loading:
            fullscreenDisplayer.displayLoader()
        case let .error(error):
            handleError(error)
        case .empty:
            break
        case let .custom(state):
            customStateHandler?.handleState(state)
        }
    }

    private func handleError(_ error: TPError) {
        switch error.type {
        case let .fullscreen(error):
            fullscreenDisplayer.displayError(error)
        case let .toast(context):
            toastManager.display(message: context.title)
        case let .custom(error):
            customStateHandler?.handleState(error)
        }
    }
}
