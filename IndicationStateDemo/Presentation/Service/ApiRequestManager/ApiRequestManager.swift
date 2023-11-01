//
//  ApiRequestManager.swift
//  IndicationStateDemo
//
//  Created by Daniil on 26.10.2023.
//

import Combine
import Foundation

// Аналог TPAPIRequestManager

class ApiRequestManager {
    let apiRequestService = ApiRequestService()

    func execute() -> AnyPublisher<TPResult, Never> {
        // дополняется request и вызывается apiRequestService
        apiRequestService.execute()
            .map { result -> Result<Void, AnyTPError> in
                    .failure(AnyTPError(ApiRequestManagerError.someApiRequestManagerError))
            }
            .eraseToAnyPublisher()
    }
}
