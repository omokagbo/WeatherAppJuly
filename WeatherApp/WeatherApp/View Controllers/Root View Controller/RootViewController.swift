//
//  RootViewController.swift
//  WeatherApp
//
//  Created by omokagbo on 12/07/2021.
//

import UIKit

final class RootViewController: UIViewController {
    
    // MARK: - Properties
    
    var rootViewModel: RootViewModel? {
        didSet {
            guard let rootViewModel = rootViewModel else {
                return
            }
            setupViewModel(with: rootViewModel)
        }
    }
    
    private let dayViewController: DayViewController = {
        guard let dayViewController = UIStoryboard
                .main
                .instantiateViewController(withIdentifier: DayViewController.storyboardIdentifier) as? DayViewController else {
                    fatalError("Unable to instantiante Day View Controller")
                }
        
        // configure day view controller
        dayViewController.view.translatesAutoresizingMaskIntoConstraints = false
        return dayViewController
    }()
    
    private let weekViewController: WeekViewController = {
        guard let weekViewController = UIStoryboard
                .main
                .instantiateViewController(withIdentifier: WeekViewController.storyboardIdentifier) as? WeekViewController else {
                    fatalError("Unable to instantiante View Controller")
                }
        
        // configure week view controller
        weekViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return weekViewController
    }()
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViewControllers()
    }
    
    private func setupChildViewControllers() {
        addChild(dayViewController)
        addChild(weekViewController)
        
        view.addSubview(dayViewController.view)
        view.addSubview(weekViewController.view)
        
        setupConstraintsForViews()
    }
    
    private func setupConstraintsForViews() {
        // Day View Controller
        dayViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dayViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dayViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dayViewController.view.heightAnchor.constraint(equalToConstant: Layout.DayView.height).isActive = true
        dayViewController.didMove(toParent: self)
        
        // Week View Controller
        weekViewController.view.topAnchor.constraint(equalTo: dayViewController.view.bottomAnchor).isActive = true
        weekViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weekViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weekViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        weekViewController.didMove(toParent: self)
    }
    
    private func setupViewModel(with: RootViewModel) {
        rootViewModel?.didFetchWeatherData = {(data, error) in
            if let error = error {
                print("unable to fetch weather data, \(error)")
            } else if let data = data {
                print("data, \(data)")
            }
        }
    }
    
}

extension RootViewController {
    
    fileprivate enum Layout {
        enum DayView {
            static let height: CGFloat = 200.0
        }
    }
    
}
