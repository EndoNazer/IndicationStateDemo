//
//  ToastHandler.swift
//  IndicationStateDemo
//
//  Created by Daniil on 31.10.2023.
//

import Combine
import Foundation

protocol ToastHandler: AnyObject {
    var subscriptions: Set<AnyCancellable> { get set }

    func subscribe(to publisher: AnyPublisher<ToastState, Never>)
    func handleState(_ state: ToastState)
}

extension ToastHandler {
    func subscribe(to publisher: AnyPublisher<ToastState, Never>) {
        publisher.sink { [weak self] state in
            self?.handleState(state)
        }
        .store(in: &subscriptions)
    }
}
