//
//  MainCustomState.swift
//  IndicationStateDemo
//
//  Created by Daniil on 27.10.2023.
//

import Foundation

struct MainCustomState: TPError {
    enum StateType: String, CustomModel {
        case customError
    }

    var type: ErrorType = .custom(error: StateType.customError)
}
