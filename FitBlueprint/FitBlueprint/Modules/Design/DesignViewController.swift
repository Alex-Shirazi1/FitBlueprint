//
//  DesignViewController.swift
//  FitBlueprint
//
//  Created by Alex Shirazi on 12/20/23.
//

import Foundation
import UIKit

protocol DesignViewControllerProtocol: AnyObject {
    
}

class DesignViewController: UIViewController, UIColorPickerViewControllerDelegate, DesignViewControllerProtocol {
    
    private var watchFacePreviewView: UIView?
    private var watchFaceColorView: UIView?
    private var colorPickerButton: UIButton?
    
    let eventHandler: DesignEventHandlerProtocol
    
    init(eventHandler: DesignEventHandlerProtocol) {
        self.eventHandler = eventHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let previewView = UIView()
        previewView.translatesAutoresizingMaskIntoConstraints = false
        previewView.layer.cornerRadius = 50
        previewView.layer.borderWidth = 10
        previewView.layer.borderColor = UIColor.gray.cgColor
        previewView.clipsToBounds = true
        view.addSubview(previewView)
        watchFacePreviewView = previewView
        
        NSLayoutConstraint.activate([
            previewView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            previewView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            previewView.widthAnchor.constraint(equalToConstant: 200),
            previewView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        let colorView = UIView()
        colorView.backgroundColor = UIColor.black
        colorView.layer.cornerRadius = previewView.layer.cornerRadius - previewView.layer.borderWidth
        colorView.clipsToBounds = true
        previewView.addSubview(colorView)
        watchFaceColorView = colorView
        
        let pickerButton = UIButton(type: .system)
        pickerButton.setTitle("Change Background Color", for: .normal)
        pickerButton.addTarget(self, action: #selector(changeBackgroundColor), for: .touchUpInside)
        pickerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pickerButton)
        colorPickerButton = pickerButton
        
        NSLayoutConstraint.activate([
            pickerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerButton.topAnchor.constraint(equalTo: previewView.bottomAnchor, constant: 20)
        ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let borderWidth = watchFacePreviewView?.layer.borderWidth {
            let inset = borderWidth
            let insetRect = watchFacePreviewView?.bounds.insetBy(dx: inset, dy: inset) ?? .zero
            watchFaceColorView?.frame = insetRect
        }
    }

    @objc func changeBackgroundColor() {
        let colorPickerViewController = UIColorPickerViewController()
        colorPickerViewController.delegate = self
        present(colorPickerViewController, animated: true, completion: nil)
    }

    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        watchFaceColorView?.backgroundColor = viewController.selectedColor
    }
}
