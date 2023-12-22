//
//  DesignViewController.swift
//  FitBlueprint
//
//  Created by Alex Shirazi on 12/20/23.
//

import Foundation
import UIKit

protocol DesignViewControllerProtocol: AnyObject {
    func didSelectColor(_ color: UIColor)
    func didToggleMetric(_ metric: String, isOn: Bool)
}

class DesignViewController: UIViewController, UIColorPickerViewControllerDelegate, MetricsPickerDelegate, DesignViewControllerProtocol {
    
    private var watchFacePreviewView = UIView()
    private var watchFaceColorView = UIView()
    private var colorPickerButton = UIButton(type: .system)
    private var metricsTableView: UITableView?
    
    let eventHandler: DesignEventHandlerProtocol
    let metricsPickerFactory: MetricsPickerFactory
    
    init(eventHandler: DesignEventHandlerProtocol, metricsPickerFactory: MetricsPickerFactory) {
        self.eventHandler = eventHandler
        self.metricsPickerFactory = metricsPickerFactory
        super.init(nibName: nil, bundle: nil)
        metricsPickerFactory.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupWatchFacePreviewView()
        setupColorPickerButton()
        setupMetricsTableView()
    }

    private func setupWatchFacePreviewView() {
        watchFacePreviewView.translatesAutoresizingMaskIntoConstraints = false
        watchFacePreviewView.layer.cornerRadius = 50
        watchFacePreviewView.layer.borderWidth = 10
        watchFacePreviewView.layer.borderColor = UIColor.gray.cgColor
        watchFacePreviewView.clipsToBounds = true
        view.addSubview(watchFacePreviewView)
        
        NSLayoutConstraint.activate([
            watchFacePreviewView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            watchFacePreviewView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            watchFacePreviewView.widthAnchor.constraint(equalToConstant: 200),
            watchFacePreviewView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        watchFaceColorView.backgroundColor = UIColor.black
        watchFaceColorView.layer.cornerRadius = watchFacePreviewView.layer.cornerRadius - watchFacePreviewView.layer.borderWidth
        watchFaceColorView.clipsToBounds = true
        watchFacePreviewView.addSubview(watchFaceColorView)
    }
    
    private func setupColorPickerButton() {
        colorPickerButton.setTitle("Change Background Color", for: .normal)
        colorPickerButton.addTarget(self, action: #selector(changeBackgroundColor), for: .touchUpInside)
        colorPickerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colorPickerButton)
        
        NSLayoutConstraint.activate([
            colorPickerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorPickerButton.topAnchor.constraint(equalTo: watchFacePreviewView.bottomAnchor, constant: 20)
        ])
    }
    
    private func setupMetricsTableView() {
        let tableView = metricsPickerFactory.createView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        metricsTableView = tableView
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: colorPickerButton.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        watchFaceColorView.frame = watchFacePreviewView.bounds.insetBy(dx: watchFacePreviewView.layer.borderWidth, dy: watchFacePreviewView.layer.borderWidth)
    }

    @objc func changeBackgroundColor() {
        let colorPickerViewController = UIColorPickerViewController()
        colorPickerViewController.delegate = self
        present(colorPickerViewController, animated: true, completion: nil)
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        watchFaceColorView.backgroundColor = viewController.selectedColor
    }
    
    func didSelectColor(_ color: UIColor) {
        watchFaceColorView.backgroundColor = color
    }
    
    func metricDidToggle(_ metric: String, isOn: Bool) {
        didToggleMetric(metric, isOn: isOn)
    }
    
    func didToggleMetric(_ metric: String, isOn: Bool) {
        // Handle the metric toggle action here.
        print("\(metric) is now \(isOn ? "on" : "off")")
    }
}
