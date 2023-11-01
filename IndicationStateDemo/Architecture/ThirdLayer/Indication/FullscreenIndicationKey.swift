//
//  FullscreenIndicationKey.swift
//  IndicationStateDemo
//
//  Created by Daniil on 31.10.2023.
//

import Foundation

struct FullscreenIndicationKey: OptionSet, Hashable {
    static let loadingKey = FullscreenIndicationKey(rawValue: 1 << 1)
    static let errorKey = FullscreenIndicationKey(rawValue: 1 << 2)
    static let emptyKey = FullscreenIndicationKey(rawValue: 1 << 3)

    let rawValue: Int

    init(rawValue: Int) {
        self.rawValue = rawValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
}
