//
//  ToastManager.swift
//  ErrorsTest
//
//  Created by Daniil on 27.10.2023.
//

import UIKit

protocol ToastDisplayer: HiddenableDisplayer {
    func display(model: ToastModel)
}

final class TPToastDisplayer: ToastDisplayer {
    let window = UIWindow()
    let toastView = ToastView(frame: .zero)

    init() {
        let viewController = UIViewController()
        viewController.view = toastView

        window.backgroundColor = .clear
        window.windowLevel = .alert

        window.rootViewController = viewController
        window.isHidden = true
    }

    func display(model: ToastModel) {
        // TODO: пока тоже строго, вряд ли получится красиво через дженерик
        guard let model = model as? TPToastModel else {
            return
        }

        window.isHidden = false

        toastView.update(with: model)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.window.isHidden = true
        }
    }

    func hideAll() {
        window.isHidden = true
    }
}
