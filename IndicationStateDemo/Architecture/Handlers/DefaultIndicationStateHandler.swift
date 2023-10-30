//
//  DefaultIndicationStateHandler.swift
//  ErrorsTest
//
//  Created by Daniil on 27.10.2023.
//

import Foundation

class DefaultIndicationStateHandler: IndicationStateHandler {
    var fullscreenDisplayer: FullscreenIndicationDisplayer
    var toastManager: ToastDisplayer
    var customStateHandler: CustomIndicationStateDisplayer?

    init(
        fullscreenDisplayer: FullscreenIndicationDisplayer,
        toastManager: ToastDisplayer,
        customStateHandler: CustomIndicationStateDisplayer?
    ) {
        self.fullscreenDisplayer = fullscreenDisplayer
        self.toastManager = toastManager
        self.customStateHandler = customStateHandler
    }
}
