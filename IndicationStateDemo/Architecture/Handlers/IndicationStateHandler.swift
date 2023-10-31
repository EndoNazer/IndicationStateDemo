//
//  IndicationStateHandler.swift
//  ErrorsTest
//
//  Created by Daniil on 27.10.2023.
//

import Foundation

protocol IndicationStateHandler {
    var indicationController: any IndicationController { get }
    var toastManager: ToastDisplayer { get }
    var customStateHandler: CustomIndicationStateDisplayer? { get }

    func setState(_ state: IndicationState)
}

extension IndicationStateHandler {
    // Первичная обработка и развод события
    func setState(_ state: IndicationState) {
        switch state {
        case .normal:
            indicationController.showState(state: state)
            toastManager.hideAll()
            customStateHandler?.hideAll()
        case .loading:
            indicationController.showState(state: state)
        case let .error(error):
            handleError(error)
        case .empty:
            indicationController.showState(state: state)
        }
    }

    private func handleError(_ error: TPError) {
        switch error.type {
        case .fullscreen:
            indicationController.showState(state: .error(error))
        case let .toast(context):
            // Что если в момент показа полноэкранной индикации показывается тост?
            // Если полноэкранная ошибка или пустое состояние, то оставить + тост
            // Если загрузка, то скрыть и показать тост?
            setState(.normal)
            toastManager.display(model: context)
        case let .custom(error):
            setState(.normal)
            customStateHandler?.handleState(error)
        }
    }
}
