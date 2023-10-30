//
//  ApiRequestServiceError.swift
//  ErrorsTest
//
//  Created by Daniil on 26.10.2023.
//

import Foundation

struct ApiRequestServiceError: Error {
    enum RequestServiceErrorType: String {
        case someApiRequestServiceError
    }

    let errorType: RequestServiceErrorType

    var message: String {
        switch errorType {
        case .someApiRequestServiceError:
            return String(describing: self)
        }
    }

    init(errorType: RequestServiceErrorType) {
        self.errorType = errorType
    }
}

extension ApiRequestServiceError: TPError {
    var type: ErrorType {
        .fullscreen(
            error: DefaultFullscreenError(
                title: errorType.rawValue,
                description: message
            )
        )
    }
}
