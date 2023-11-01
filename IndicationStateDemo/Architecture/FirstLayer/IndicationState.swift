//
//  IndicationState.swift
//  IndicationStateDemo
//
//  Created by Daniil on 31.10.2023.
//

import Foundation

enum IndicationState {
    case normal
    case loading
    case error(model: ErrorModel)
    case empty(model: EmptyModel)
    case custom(model: CustomModel)
}
