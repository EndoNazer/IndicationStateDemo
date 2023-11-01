//
//  ApiRequestManagerError.swift
//  IndicationStateDemo
//
//  Created by Daniil on 26.10.2023.
//

import Foundation

enum ApiRequestManagerError: Error {
    case someApiRequestManagerError
}

extension ApiRequestManagerError: TPError {
    var type: ErrorType {
        .toast(error: TPToastModel(type: .error(message: "ApiRequestManagerError")))
    }
}
