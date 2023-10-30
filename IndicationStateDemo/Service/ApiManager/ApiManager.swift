//
//  ApiManager.swift
//  ErrorsTest
//
//  Created by Daniil on 26.10.2023.
//

import Combine
import Foundation

// Аналог APIManager

class ApiManager {
    let requestService = ApiRequestManager()

    func loadFromNetwork() -> AnyPublisher<TPResult, Never> {
        requestService.execute()
    }
}
