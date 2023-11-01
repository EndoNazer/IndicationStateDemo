//
//  TPIndicationStateHandler.swift
//  IndicationStateDemo
//
//  Created by Daniil on 31.10.2023.
//

import Combine
import Foundation

protocol TPIndicationStateHandler: IndicationStateHandler {
    var fullscreenSubject: PassthroughSubject<FullscreenState, Never> { get }
    var toastSubject: PassthroughSubject<ToastState, Never> { get }
    var customSubject: PassthroughSubject<CustomState, Never> { get }

    func subscribeToIndicationState(
        fullscreenHandler: FullscreenHandler,
        toastHandler: ToastHandler,
        customHandler: CustomHandler?
    )
}

extension TPIndicationStateHandler {
    func setState(_ state: IndicationState) {
        switch state {
        case .normal:
            fullscreenSubject.send(.hidden)
            toastSubject.send(.hidden)
            customSubject.send(.hidden)
        case .loading:
            fullscreenSubject.send(.loading)
        case let .error(model):
            guard let model = model as? TPError else {
                return
            }
            handleError(model)
        case let .empty(model):
            guard let model = model as? TPEmpty else {
                return
            }
            handleEmpty(model)
        case let .custom(model):
            customSubject.send(.show(model))
        }
    }

    private func handleError(_ error: TPError) {
        switch error.type {
        case let .fullscreen(error):
            fullscreenSubject.send(.error(error))
        case let .toast(error):
            // Что если в момент показа полноэкранной индикации показывается тост?
            // Если полноэкранная ошибка или пустое состояние, то оставить + тост
            // Если загрузка, то скрыть и показать тост?
            setState(.normal)
            toastSubject.send(.show(error))
        case let .custom(error):
            setState(.normal)
            customSubject.send(.show(error))
        }
    }

    private func handleEmpty(_ empty: TPEmpty) {
        switch empty.type {
        case let .fullscreen(model):
            fullscreenSubject.send(.empty(model))
        case let .toast(model):
            setState(.normal)
            toastSubject.send(.show(model))
        case let .custom(model):
            setState(.normal)
            customSubject.send(.show(model))
        }
    }
}
