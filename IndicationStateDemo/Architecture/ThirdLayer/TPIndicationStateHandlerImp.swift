//
//  TPIndicationStateHandlerImp.swift
//  IndicationStateDemo
//
//  Created by Daniil on 31.10.2023.
//

import Combine
import Foundation

class TPIndicationStateHandlerImp: TPIndicationStateHandler {
    let fullscreenSubject = PassthroughSubject<FullscreenState, Never>()
    let toastSubject = PassthroughSubject<ToastState, Never>()
    let customSubject = PassthroughSubject<CustomState, Never>()

    var toastHandler: ToastHandler

    init(toastHandler: ToastHandler) {
        self.toastHandler = toastHandler
    }

    func subscribeToIndicationState(
        fullscreenHandler: FullscreenHandler,
        customHandler: CustomHandler?
    ) {
        subscribeToIndicationState(
            fullscreenHandler: fullscreenHandler,
            toastHandler: toastHandler,
            customHandler: customHandler
        )
    }

    func subscribeToIndicationState(
        fullscreenHandler: FullscreenHandler,
        toastHandler: ToastHandler,
        customHandler: CustomHandler?
    ) {
        fullscreenHandler.subscribe(to: fullscreenSubject.eraseToAnyPublisher())
        toastHandler.subscribe(to: toastSubject.eraseToAnyPublisher())
        customHandler?.subscribe(to: customSubject.eraseToAnyPublisher())
    }
}
