//
//  TPToastError.swift
//  ErrorsTest
//
//  Created by Daniil on 26.10.2023.
//

import Foundation

protocol ToastError {
    var title: String { get }
}

struct DefaultToastError: ToastError {
    let title: String
}
