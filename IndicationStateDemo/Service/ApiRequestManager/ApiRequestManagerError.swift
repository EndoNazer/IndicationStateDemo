//
//  ApiRequestManagerError.swift
//  ErrorsTest
//
//  Created by Daniil on 26.10.2023.
//

import Foundation

enum ApiRequestManagerError: Error {
    case someApiRequestManagerError
}

extension ApiRequestManagerError: TPError {
    var type: ErrorType {
        .toast(error: DefaultToastError(title: "JEPA"))
    }
}
