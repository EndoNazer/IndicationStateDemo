//
//  ApiManagerError.swift
//  ErrorsTest
//
//  Created by Daniil on 26.10.2023.
//

import Foundation

enum ApiManagerError: Error {
    case someApiManagerError
}

extension ApiManagerError: TPError {
    var type: ErrorType {
        .toast(error: DefaultToastError(title: "JEPA"))
    }
}
