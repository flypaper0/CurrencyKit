//
//  ViewController.swift
//  Example
//
//  Created by Oskari Rauta on 22/05/2018.
//  Copyright © 2018 Oskari Rauta. All rights reserved.
//

import UIKit
import CommonKit
import CurrencyKit

class ViewController: UIViewController {

    lazy var moneyField: CurrencyField = CurrencyField.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.borderStyle = .bezel
        $0.allowSignChange = true
        $0.clearButtonMode = .whileEditing
        $0.maximum = 5000
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(self.moneyField)
        self.moneyField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40.0).isActive = true
        self.moneyField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0).isActive = true
        self.moneyField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0).isActive = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.moneyField.becomeFirstResponder()
    }

}

