//
//  AddNewStockViewController.swift
//  TickStock
//
//  Created by Jacob O'Donnell on 8/13/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import UIKit

class AddNewStockViewController: UIViewController {
    override func loadView() {
        let view = UIView(frame: UIScreen.mainScreen().applicationFrame)
        view.backgroundColor = UIColor.whiteColor()

        view.addSubview(self.newStockLabel())
        view.addSubview(self.newStockField())

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        var flipButton = UIBarButtonItem(title:"YAY", style: UIBarButtonItemStyle.Bordered, target:self, action:"newStock")
        self.navigationItem.rightBarButtonItem = flipButton
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func newStock() {
        //UIViewController * vc = [[UIViewController alloc] init];
    //[self presentViewController:vc animated:YES completion:nil];

    }

    func newStockLabel() -> UILabel {
        let label = UILabel(frame: CGRect(x: 10, y: 92, width: 120, height: 15))
        label.text = "Stock name: "
        label.font = UIFont.boldSystemFontOfSize(15.0)
        label.textColor = UIColor.blackColor()
        return label
    }
    
    func newStockField() -> UITextField {
        let newStockField = UITextField(frame: CGRect(x: 110, y: 80, width: 200, height: 40))
        newStockField.borderStyle = UITextBorderStyle.RoundedRect
        newStockField.font = UIFont.systemFontOfSize(15)
        newStockField.placeholder = "Name"
        newStockField.autocorrectionType = UITextAutocorrectionType.No
        newStockField.keyboardType = UIKeyboardType.Default
        newStockField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        return newStockField
    }
}

