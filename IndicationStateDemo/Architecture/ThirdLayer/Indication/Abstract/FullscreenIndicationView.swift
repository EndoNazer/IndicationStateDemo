//
//  FullscreenIndicationView.swift
//  IndicationStateDemo
//
//  Created by Daniil on 30.10.2023.
//

import UIKit

protocol FullscreenIndicationView {
    var indicationHostView: FullscreenIndicationHostView { get }
    var indicationMargins: UIEdgeInsets { get set }

    func registrate<T>(key: FullscreenIndicationKey, factory: @escaping (T) -> UIView)
    func showState<T>(key: FullscreenIndicationKey, inputData: T)

    func hideAllViews()
}

extension FullscreenIndicationView where Self: UIView {
    var indicationHostView: FullscreenIndicationHostView {
        if let container = subviews.compactMap({ $0 as? FullscreenIndicationHostView }).first {
            return container
        }

        let view = FullscreenIndicationHostView(frame: bounds)
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

extension FullscreenIndicationView {
    func registrate<T>(key: FullscreenIndicationKey, factory: @escaping (T) -> UIView) {
        indicationHostView.registrate(provider: IndicationViewProviderImp(block: factory), for: key)
    }

    func registrate(key: FullscreenIndicationKey, factory: @escaping () -> UIView) {
        indicationHostView.registrate(provider: IndicationViewProviderImp(block: factory), for: key)
    }

    func showState<T>(key: FullscreenIndicationKey, inputData: T) {
        indicationHostView.displayView(for: key, inputData: inputData)
    }

    func showState(key: FullscreenIndicationKey) {
        showState(key: key, inputData: ())
    }

    func hideAllViews() {
        indicationHostView.hideAllViews()
    }
}
