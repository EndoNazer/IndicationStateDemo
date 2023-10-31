//
//  IndicationController.swift
//  IndicationStateDemo
//
//  Created by Daniil on 30.10.2023.
//

import UIKit

protocol IndicationController {
    associatedtype View: IndicationView

    var rootView: View { get }

    func showState(state: IndicationState)
}
