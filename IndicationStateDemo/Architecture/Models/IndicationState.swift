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
    case empty
    case custom(CustomIndicationState)
}
