//
//  IndicationHostView.swift
//  IndicationStateDemo
//
//  Created by Daniil on 30.10.2023.
//

import UIKit

final class IndicationHostView: UIView {
    var enableBackgroundColor: Bool = true
    var customBackgroundColor: UIColor?

    private var cache: [IndicationStateKey: IndicationViewProvider] = [:]

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        subviews.contains {
            !$0.isHidden && $0.alpha > 0 && $0.isUserInteractionEnabled && $0.point(inside: convert(point, to: $0), with: event)
        }
    }

    func registrate(provider: IndicationViewProvider, for key: IndicationStateKey) {
        cache[key] = provider
    }

    func displayView<T>(for key: IndicationStateKey, inputData: T) {
        guard let provider = cache[key] else {
            return
        }

        backgroundColor = enableBackgroundColor ? .white : customBackgroundColor
        subviews.forEach { $0.removeFromSuperview() }

        let view = provider.resolve(inputData: inputData)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)

        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            view.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            view.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])

        addFadeTransition()
    }

    func hideAllViews() {
        backgroundColor = .clear
        subviews.forEach { $0.removeFromSuperview() }
        addFadeTransition()
    }

    private func addFadeTransition() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.type = .fade
        animation.duration = 0.25
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}
