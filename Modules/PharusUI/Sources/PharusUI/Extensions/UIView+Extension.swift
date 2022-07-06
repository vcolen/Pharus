//
//  UIView+Extension.swift
//  Pharus
//
//  Created by Victor Colen on 27/03/22.
//

import UIKit

public extension UIView {
    // MARK: - Constraints
    func stretch(_ view: UIView,
                 to otherView: UIView? = nil,
                 top: CGFloat = 0,
                 left: CGFloat = 0,
                 bottom: CGFloat = 0,
                 right: CGFloat = 0) {
        view.translatesAutoresizingMaskIntoConstraints = false

        if let otherView = otherView {
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: otherView.topAnchor, constant: top),
                view.leftAnchor.constraint(equalTo: otherView.leftAnchor, constant: left),
                view.rightAnchor.constraint(equalTo: otherView.rightAnchor, constant: right),
                view.bottomAnchor.constraint(equalTo: otherView.bottomAnchor, constant: bottom)
            ])
        } else {
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: topAnchor, constant: top),
                view.leftAnchor.constraint(equalTo: leftAnchor, constant: left),
                view.rightAnchor.constraint(equalTo: rightAnchor, constant: right),
                view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottom)
            ])
        }
    }

    func edges() {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(
                equalTo: self.superview?.topAnchor ?? topAnchor
            ),
            self.bottomAnchor.constraint(
                equalTo: self.superview?.bottomAnchor ?? bottomAnchor
            ),
            self.leadingAnchor.constraint(
                equalTo: self.superview?.leadingAnchor ?? leadingAnchor
            ),
            self.trailingAnchor.constraint(
                equalTo: self.superview?.trailingAnchor ?? trailingAnchor
            )
        ])
    }

    func frame(width: CGFloat? = nil, height: CGFloat? = nil) -> Self {
            if let width = width {
                self.widthAnchor.constraint(equalToConstant: width).isActive = true
            }

            if let height = height {
                self.heightAnchor.constraint(equalToConstant: height).isActive = true
            }

            return self
        }

    func center(in otherView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        otherView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: otherView.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: otherView.centerYAnchor)
        ])
    }

    // MARK: - Add Background
    func addBackground(imageName: String,
                       contentMode: UIView.ContentMode = .scaleToFill) {
        print(UIScreen.main.bounds.height)
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = UIImage(named: imageName)
        backgroundImageView.contentMode = contentMode
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(backgroundImageView)
        sendSubviewToBack(backgroundImageView)

        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Click action
public class ClickListener: UITapGestureRecognizer {
    public var onClick: (() -> Void)?
}

public extension UIView {
    func setOnClickListener(action: @escaping () -> Void) {
        let tapRecogniser = ClickListener(target: self, action: #selector(onViewClicked(sender:)))
        tapRecogniser.onClick = action
        self.addGestureRecognizer(tapRecogniser)
    }

    @objc func onViewClicked(sender: ClickListener) {
        if let onClick = sender.onClick {
            onClick()
        }
    }
}
