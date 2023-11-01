//
//  ViewController.swift
//  IndicationStateDemo
//
//  Created by Daniil on 26.10.2023.
//

import Combine
import UIKit

final class ViewController: UIViewController, FullscreenIndicationController {
    var rootView = MainView(frame: .zero)
    lazy var presenter = Presenter(toastHandler: ToastManager())

    var subscriptions = Set<AnyCancellable>()

    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.subscribeToIndicationState(
            fullscreenHandler: self,
            customHandler: self
        )

        rootView.actionPublisher
            .sink { [weak self] _ in
                self?.presenter.loadData()
            }
            .store(in: &subscriptions)
    }
}

extension ViewController: CustomHandler {
    func handleState(_ state: CustomState) {
        switch state {
        case let .show(customModel):
            showCustomState(model: customModel)
        case .hidden:
            print("hide custom state")
        }

    }

    private func showCustomState(model: CustomModel) {
        // Пока так, но надо на дженерик перевести, наверное. Чтобы без каста обойтись
        // upd. с дженериком, похоже, нереально сделать, чтобы не задеть презентер
        guard let state = model as? MainCustomState.StateType else {
            return
        }

        print(state.rawValue)
    }
}
