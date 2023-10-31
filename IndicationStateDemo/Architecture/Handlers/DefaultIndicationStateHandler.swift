//
//  DefaultIndicationStateHandler.swift
//  ErrorsTest
//
//  Created by Daniil on 27.10.2023.
//

import Foundation

class DefaultIndicationStateHandler: IndicationStateHandler {
    var indicationController: any IndicationController
    var toastManager: ToastDisplayer
    var customStateHandler: CustomIndicationStateDisplayer?

    init(
        indicationController: any IndicationController,
        toastManager: ToastDisplayer,
        customStateHandler: CustomIndicationStateDisplayer?
    ) {
        self.indicationController = indicationController
        self.toastManager = toastManager
        self.customStateHandler = customStateHandler
    }
}
