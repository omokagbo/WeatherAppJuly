//
//  UIStoryboard+Extension.swift
//  WeatherApp
//
//  Created by omokagbo on 12/07/2021.
//

import UIKit

extension UIStoryboard {
    
    // MARK: - Static Properties
    
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static var day: UIStoryboard {
        return UIStoryboard(name: "Day", bundle: Bundle.main)
    }
    
    static var week: UIStoryboard {
        return UIStoryboard(name: "Week", bundle: Bundle.main)
    }
    
}
