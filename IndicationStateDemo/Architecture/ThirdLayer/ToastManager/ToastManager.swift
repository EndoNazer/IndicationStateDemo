//
//  ToastManager.swift
//  IndicationStateDemo
//
//  Created by Daniil on 27.10.2023.
//

import Combine
import UIKit

protocol ToastManagerProtocol: ToastHandler {}

final class ToastManager: ToastManagerProtocol {
    let window = UIWindow()
    let toastView = ToastView(frame: .zero)

    var subscriptions = Set<AnyCancellable>()

    init() {
        let viewController = UIViewController()
        viewController.view = toastView

        window.backgroundColor = .clear
        window.windowLevel = .alert

        window.rootViewController = viewController
        window.isHidden = true
    }

    func handleState(_ state: ToastState) {
        switch state {
        case let .show(model):
            display(model: model)
        case .hidden:
            window.isHidden = true
        }
    }

    private func display(model: ToastModel) {
        // TODO: пока тоже через каст, вряд ли получится красиво через дженерик
        guard let model = model as? TPToastModel else {
            return
        }

        window.isHidden = false

        toastView.update(with: model)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.window.isHidden = true
        }
    }
}
