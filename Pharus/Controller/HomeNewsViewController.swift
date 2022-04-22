//
//  HomeNewsViewController.swift
//  Pharus
//
//  Created by Victor Colen on 21/04/22.
//

import UIKit

class HomeNewsViewController: UIViewController {
    
    private var customView = HomeNewsView()
    var page: Pages
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = customView
    }
    
    init(with page: Pages) {
        self.page = page
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
