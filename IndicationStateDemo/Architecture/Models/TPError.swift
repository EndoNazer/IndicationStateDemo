//
//  TPError.swift
//  ErrorsTest
//
//  Created by Daniil on 26.10.2023.
//

import Foundation

protocol TPError: Error {
    var type: ErrorType { get }
}

enum ErrorType {
    case fullscreen(error: FullscreenError)
    case toast(error: ToastModel)
    case custom(error: CustomError)
}

// Type-Erasure для TPError
struct AnyTPError: TPError {
    var type: ErrorType {
        get {
            base.type
        }
    }
    
    private var base: any TPError

    init(_ base: any TPError) {
        self.base = base
    }
}
