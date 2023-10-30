//
//  Presenter.swift
//  ErrorsTest
//
//  Created by Daniil on 26.10.2023.
//

import Combine
import Foundation

final class Presenter: DefaultIndicationStateHandler {
    let apiManager = ApiManager()
    var subscriptions = Set<AnyCancellable>()

    func loadData() {
        setState(.loading)

        apiManager.loadFromNetwork()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] result in
                switch result {
                case .success:
                    self?.setState(.normal)
                case let .failure(error):
                    self?.setState(.error(error))
                }
            })
            .store(in: &subscriptions)
    }
}
