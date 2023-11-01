//
//  ApiManagerError.swift
//  IndicationStateDemo
//
//  Created by Daniil on 26.10.2023.
//

import Foundation

enum ApiManagerError: Error {
    case someApiManagerError
}

extension ApiManagerError: TPError {
    var type: ErrorType {
        .toast(error: TPToastModel(type: .information(title: "ApiManagerError")))
    }
}
