//
//  ToastView.swift
//  IndicationStateDemo
//
//  Created by Daniil on 31.10.2023.
//

import UIKit

final class ToastView: UIView {
    private let titleLabel = UILabel().prepare {
        $0.textAlignment = .center
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with data: TPToastModel) {
        titleLabel.text = data.text
    }

    func configure() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
