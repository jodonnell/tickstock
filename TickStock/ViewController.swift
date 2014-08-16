//
//  ViewController.swift
//  TickStock
//
//  Created by Jacob O'Donnell on 8/13/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()

        let newStockButton = UIBarButtonItem(title:"Add new stock", style: UIBarButtonItemStyle.Bordered, target:self, action:"newStock")
        self.navigationItem.rightBarButtonItem = newStockButton
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func newStock() {
        let vc = AddNewStockViewController(nibName: nil, bundle: nil)
        self.navigationController.pushViewController(vc, animated:true)

    }
}

