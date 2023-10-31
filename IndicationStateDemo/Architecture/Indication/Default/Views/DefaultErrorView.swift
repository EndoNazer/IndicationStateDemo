//
//  DefaultErrorView.swift
//  IndicationStateDemo
//
//  Created by Daniil on 30.10.2023.
//

import UIKit

final class DefaultErrorView: UIView {
    private let titleLabel = UILabel(frame: .zero)
    private let descriptionLabel = UILabel(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateWith(data: FullscreenError) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }

    private func configure() {
        let containerStack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel]).prepare {
            $0.axis = .vertical
            $0.spacing = 10
            $0.alignment = .center
        }
        containerStack.backgroundColor = .red
        addSubview(containerStack)

        containerStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
