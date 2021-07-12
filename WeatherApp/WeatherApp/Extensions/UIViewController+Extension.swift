//
//  UIViewController+Extension.swift
//  WeatherApp
//
//  Created by omokagbo on 12/07/2021.
//

import UIKit

extension UIViewController {
    
    // MARK: - Static Properties
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
