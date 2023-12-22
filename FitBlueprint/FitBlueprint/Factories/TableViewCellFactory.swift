//
//  TableViewCellFactory.swift
//  IOS_Client
//
//  Created by Alex Shirazi on 12/14/23.
//

import Foundation

import UIKit

protocol TableViewCellFactoryType {
    func styleCell(cell: UITableViewCell, tableOption: TableOption) -> UITableViewCell
    
    func styleCell(cell: UITableViewCell, label: String) -> UITableViewCell
}

/// This File ensures that we have a common type of cell across the app, and to reduce redundant code
class TableViewCellFactory: TableViewCellFactoryType {
    func styleCell(cell: UITableViewCell, tableOption: TableOption) -> UITableViewCell {
        cell.textLabel?.text = tableOption.text
        cell.imageView?.image = UIImage(systemName: tableOption.image)
        
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = .systemBackground
        
        // Determine the interface style and set the border color accordingly
        let currentInterfaceStyle = cell.traitCollection.userInterfaceStyle
        let borderColor: UIColor = (currentInterfaceStyle == .light) ? .black : .white
        cell.layer.borderColor = borderColor.cgColor
        cell.layer.borderWidth = 1
        cell.clipsToBounds = true
        
        return cell
    }
    func styleCell(cell: UITableViewCell, label: String) -> UITableViewCell {
        cell.textLabel?.text = label
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = .systemBackground
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.clipsToBounds = true
        
        return cell
    }
}
// Define your custom colors for dark green and light green
extension UIColor {
    static let darkGreen = UIColor(red: 0, green: 0.39, blue: 0, alpha: 1) // Adjust the RGB values as needed
    static let lightGreen = UIColor(red: 0.56, green: 1, blue: 0.56, alpha: 1) // Adjust the RGB values as needed
}
