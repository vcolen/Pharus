//
//  ProjectRulesViewController.swift
//  Pharus
//
//  Created by Victor Colen on 06/04/22.
//

import UIKit

class ProjectRulesViewController: UIViewController {
    
    var rules: String?
    var coordinator: LoginCoordinator?
    var customView = ProjectSheetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        customView.closeButton.addAction(UIAction { _ in
//            self.dismiss(animated: true)
//        }, for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = customView
//        if let rules = rules {
//            customView.descriptionTextLabel.text = rules
//        }
    }
}
