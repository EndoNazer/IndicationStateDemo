//
//  CustomHandler.swift
//  IndicationStateDemo
//
//  Created by Daniil on 31.10.2023.
//

import Combine
import Foundation

protocol CustomHandler: AnyObject {
    var subscriptions: Set<AnyCancellable> { get set }

    func subscribe(to publisher: AnyPublisher<CustomState, Never>)
    func handleState(_ state: CustomState)
}

extension CustomHandler {
    func subscribe(to publisher: AnyPublisher<CustomState, Never>) {
        publisher.sink { [weak self] state in
            self?.handleState(state)
        }
        .store(in: &subscriptions)
    }
}
