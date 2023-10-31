//
//  MainCustomState.swift
//  ErrorsTest
//
//  Created by Daniil on 27.10.2023.
//

import Foundation

struct MainCustomState: TPError {
    enum StateType: String, CustomError {
        case testError
    }

    var type: ErrorType = .custom(error: StateType.testError)
}
