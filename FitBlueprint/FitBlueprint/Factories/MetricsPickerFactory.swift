//
//  MetricsPickerFactory.swift
//  FitBlueprint
//
//  Created by Alex Shirazi on 12/20/23.
//

import Foundation
import UIKit

protocol MetricsPickerDelegate: AnyObject {
    func metricDidToggle(_ metric: String, isOn: Bool)
}

class MetricsPickerFactory: NSObject {
    weak var delegate: MetricsPickerDelegate?
    let metrics: [String] = ["Heart Rate", "Calories", "Distance", "Duration"] // Your metrics options
    
    func createView() -> UITableView {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MetricsCell")
        return tableView
    }
}

extension MetricsPickerFactory: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return metrics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MetricsCell", for: indexPath)
        cell.textLabel?.text = metrics[indexPath.row]
        // Add a switch to the cell
        let metricSwitch = UISwitch()
        metricSwitch.tag = indexPath.row // Use the row as a tag to identify which metric switch was toggled
        metricSwitch.addTarget(self, action: #selector(metricSwitchChanged(_:)), for: .valueChanged)
        cell.accessoryView = metricSwitch
        return cell
    }
    
    @objc func metricSwitchChanged(_ sender: UISwitch) {
        let metric = metrics[sender.tag]
        delegate?.metricDidToggle(metric, isOn: sender.isOn)
    }
}
