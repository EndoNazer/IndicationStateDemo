//
//  IndicationViewProvider.swift
//  IndicationStateDemo
//
//  Created by Daniil on 30.10.2023.
//

import UIKit

protocol IndicationViewProvider {
    func resolve<T>(inputData: T) -> UIView
}

final class IndicationViewProviderImp<InputData>: IndicationViewProvider {
    private let block: (InputData) -> UIView

    init(block: @escaping (InputData) -> UIView) {
        self.block = block
    }

    func resolve<T>(inputData: T) -> UIView {
        guard let inputData = inputData as? InputData else {
            fatalError("Fail resolve indication view. Not casted \(T.self) to \(InputData.self)")
        }

        return block(inputData)
    }
}
