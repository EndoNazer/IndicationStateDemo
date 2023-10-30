//
//  ViewController.swift
//  ErrorsTest
//
//  Created by Daniil on 26.10.2023.
//

import Combine
import UIKit

final class ViewController: UIViewController, FullscreenIndicationDisplayer {

    lazy var presenter = Presenter(fullscreenDisplayer: self, toastManager: TPToastDisplayer(), customStateHandler: self)
    let rootView = MainView()

    var subscriptions = Set<AnyCancellable>()

    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.actionPublisher
            .sink { [weak self] _ in
                self?.presenter.loadData()
            }
            .store(in: &subscriptions)
    }
}

extension ViewController: CustomIndicationStateDisplayer {
    func handleState(_ state: CustomIndicationState) {
        // Пока так, но надо на дженерик перевести, наверное. Чтобы без каста обойтись
        guard let state = state as? MainCustomState else {
            return
        }

        print(state.type.rawValue)
    }
}
