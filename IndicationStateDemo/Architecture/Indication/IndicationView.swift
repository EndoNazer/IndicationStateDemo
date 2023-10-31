//
//  IndicationView.swift
//  IndicationStateDemo
//
//  Created by Daniil on 30.10.2023.
//

import UIKit

protocol IndicationView {
    var indicationHostView: IndicationHostView { get }
    var indicationMargins: UIEdgeInsets { get set }

    func registrate<T>(key: IndicationStateKey, factory: @escaping (T) -> UIView)
    func showState<T>(key: IndicationStateKey, inputData: T)

    func hideAllViews()
}

extension IndicationView where Self: UIView {
    var indicationHostView: IndicationHostView {
        if let container = subviews.compactMap({ $0 as? IndicationHostView }).first {
            return container
        }

        let view = IndicationHostView(frame: bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutMargins = .zero
        view.insetsLayoutMarginsFromSafeArea = false
        addSubview(view)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leftAnchor.constraint(equalTo: leftAnchor),
            view.rightAnchor.constraint(equalTo: rightAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        return view
    }

    var indicationMargins: UIEdgeInsets {
        get {
            indicationHostView.layoutMargins
        }
        set {
            indicationHostView.layoutMargins = newValue
        }
    }
}

extension IndicationView {
    func registrate<T>(key: IndicationStateKey, factory: @escaping (T) -> UIView) {
        indicationHostView.registrate(provider: IndicationViewProviderImp(block: factory), for: key)
    }

    func registrate(key: IndicationStateKey, factory: @escaping () -> UIView) {
        indicationHostView.registrate(provider: IndicationViewProviderImp(block: factory), for: key)
    }

    func showState<T>(key: IndicationStateKey, inputData: T) {
        indicationHostView.displayView(for: key, inputData: inputData)
    }

    func showState(key: IndicationStateKey) {
        showState(key: key, inputData: ())
    }

    func hideAllViews() {
        indicationHostView.hideAllViews()
    }
}
