//
//  PercentageGradientViewController.swift
//  GradientKit
//
//  Created by Joe Fabisevich on 7/4/18.
//  Copyright © 2018 Mergesort. All rights reserved.
//

import UIKit

class PercentageGradientViewController: UIViewController {

    private let backgroundGradientView: GradientView = {
        let gradientView = GradientView()
        gradientView.gradient = PercentageGradient(baseColor: #colorLiteral(red: 0.05882352941, green: 0.4509803922, blue: 0.6980392157, alpha: 1), percentage: 0.2)

        return gradientView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.backgroundGradientView)

        let backgroundConstraints = [
            self.backgroundGradientView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backgroundGradientView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.backgroundGradientView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backgroundGradientView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ]

        NSLayoutConstraint.activate(backgroundConstraints)
    }

}

