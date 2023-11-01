//
//  FullscreenIndicationViewProvider.swift
//  IndicationStateDemo
//
//  Created by Daniil on 01.11.2023.
//

import UIKit

protocol FullscreenIndicationViewProvider {
    func resolve<T>(inputData: T) -> UIView
}
