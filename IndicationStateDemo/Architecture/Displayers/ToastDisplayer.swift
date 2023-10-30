//
//  ToastManager.swift
//  ErrorsTest
//
//  Created by Daniil on 27.10.2023.
//

import Foundation

protocol ToastDisplayer: HiddenableDisplayer {
    func display(message: String)
}

final class TPToastDisplayer: ToastDisplayer {
    func display(message: String) {
        print(message)
    }

    func hideAll() {

    }
}
