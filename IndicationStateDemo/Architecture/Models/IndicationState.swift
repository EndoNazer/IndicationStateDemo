//
//  IndicationState.swift
//  ErrorsTest
//
//  Created by Daniil on 27.10.2023.
//

import Foundation

enum IndicationState {
    case normal
    case loading
    case error(TPError)
    case empty(EmptyModel)
    // TODO: нужен ли отдельный кейс для кастомного стейта? При условии, что можно стандартные вью для состояний выше подменить?

    static let normalKey = IndicationStateKey(rawValue: 1 << 0)
    static let loadingKey = IndicationStateKey(rawValue: 1 << 1)
    static let errorKey = IndicationStateKey(rawValue: 1 << 2)
    static let emptyKey = IndicationStateKey(rawValue: 1 << 3)

    var key: IndicationStateKey {
        switch self {
        case .normal:
            return Self.normalKey
        case .loading:
            return Self.loadingKey
        case .error:
            return Self.errorKey
        case .empty:
            return Self.emptyKey
        }
    }
}
