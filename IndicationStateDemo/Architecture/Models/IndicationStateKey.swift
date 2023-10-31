//
//  IndicationStateKey.swift
//  IndicationStateDemo
//
//  Created by Daniil on 31.10.2023.
//

import Foundation

struct IndicationStateKey: OptionSet, Hashable {
    let rawValue: Int

    init(rawValue: Int) {
        self.rawValue = rawValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
}
