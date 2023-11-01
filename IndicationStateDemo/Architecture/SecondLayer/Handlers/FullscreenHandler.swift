//
//  FullscreenHandler.swift
//  IndicationStateDemo
//
//  Created by Daniil on 31.10.2023.
//

import Combine
import Foundation

protocol FullscreenHandler: AnyObject {
    var subscriptions: Set<AnyCancellable> { get set }

    func subscribe(to publisher: AnyPublisher<FullscreenState, Never>)
    func handleState(_ state: FullscreenState)
}

extension FullscreenHandler {
    func subscribe(to publisher: AnyPublisher<FullscreenState, Never>) {
        publisher.sink { [weak self] state in
            self?.handleState(state)
        }
        .store(in: &subscriptions)
    }
}
