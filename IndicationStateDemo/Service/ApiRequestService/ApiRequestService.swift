//
//  ApiRequestService.swift
//  ErrorsTest
//
//  Created by Daniil on 26.10.2023.
//

import Combine
import Foundation

// Аналог APIRequestService

class ApiRequestService {
    func execute() -> AnyPublisher<TPResult, Never> {
        Just(.failure(AnyTPError(ApiRequestServiceError(errorType: .someApiRequestServiceError))))
            .delay(for: 3, scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
