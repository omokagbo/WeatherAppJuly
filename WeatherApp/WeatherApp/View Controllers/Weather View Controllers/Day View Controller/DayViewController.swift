//
//  DayViewController.swift
//  WeatherApp
//
//  Created by Decagon on 12/07/2021.
//

import UIKit

final class DayViewController: UIViewController {
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Helper Methods
    
    private func setupView() {
        // configure
        view.backgroundColor = .systemGreen
    }
    
}
