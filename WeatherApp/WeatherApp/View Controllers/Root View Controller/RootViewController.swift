//
//  RootViewController.swift
//  WeatherApp
//
//  Created by omokagbo on 12/07/2021.
//

import UIKit

final class RootViewController: UIViewController {

    // MARK:- View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .systemIndigo
    }

}

