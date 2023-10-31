//
//  ViewController.swift
//  ErrorsTest
//
//  Created by Daniil on 26.10.2023.
//

import Combine
import UIKit

final class ViewController: UIViewController, DefaultIndicationController {
    var rootView = MainView(frame: .zero)
    lazy var presenter = Presenter(indicationController: self, toastManager: TPToastDisplayer(), customStateHandler: self)

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
    func handleState(_ state: CustomError) {
        // Пока так, но надо на дженерик перевести, наверное. Чтобы без каста обойтись
        // upd. с дженериком, похоже, нереально сделать, чтобы не задеть презентер
        guard let state = state as? MainCustomState.StateType else {
            return
        }

        print(state.rawValue)
    }

    func hideAll() {

    }
}
