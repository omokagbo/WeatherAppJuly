//
//  RootViewController.swift
//  WeatherApp
//
//  Created by omokagbo on 12/07/2021.
//

import UIKit

final class RootViewController: UIViewController {
    
    private enum AlertType {
        case noWeatherDataAvailable
    }
    
    // MARK: - Properties
    
    var viewModel: RootViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            setupViewModel(with: viewModel)
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
        viewModel?.didFetchWeatherData = { [weak self] (data, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    self?.presentAlert(of: .noWeatherDataAvailable)
                }
            } else if let data = data {
                print("data, \(data)")
            } else {
                DispatchQueue.main.async {
                    self?.presentAlert(of: .noWeatherDataAvailable)
                }
            }
        }
    }
    
    private func presentAlert(of alertType: AlertType) {
        let title: String
        let message: String
        
        switch alertType {
        case .noWeatherDataAvailable:
            title = "Unable to fetch weather data"
            message = "The application is unable to fetch weather data. Please make sure your device is connected over wifi or cellular."
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
}

extension RootViewController {
    
    fileprivate enum Layout {
        enum DayView {
            static let height: CGFloat = 200.0
        }
    }
    
}
