//
//  Publisher+mapToVoid.swift
//  ErrorsTest
//
//  Created by Daniil on 27.10.2023.
//

import Combine

extension Publisher {
    func mapToVoid() -> Publishers.Map<Self, Void> {
        map { _ in () }
    }
}
