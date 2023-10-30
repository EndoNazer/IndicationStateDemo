//
//  MainCustomState.swift
//  ErrorsTest
//
//  Created by Daniil on 27.10.2023.
//

import Foundation

struct MainCustomState: CustomIndicationState {
    let type: MainCustomStateType
}

enum MainCustomStateType: String, CustomError {
    case error
}
