//
//  AddNewStockViewController.swift
//  TickStock
//
//  Created by Jacob O'Donnell on 8/13/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import UIKit

class AddNewStockViewController: UIViewController {
    var name: UITextField
    var price: UITextField
    var number: UITextField
    var nameLabel: UILabel
    var priceLabel: UILabel
    var numberLabel: UILabel

    override init(nibName: String!, bundle: NSBundle!) {
        let frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        self.nameLabel = UILabel(frame: frame)
        self.name = UITextField(frame: frame)
        self.priceLabel = UILabel(frame: frame)
        self.price = UITextField(frame: frame)
        self.numberLabel = UILabel(frame: frame)
        self.number = UITextField(frame: frame)

        super.init(nibName: nibName, bundle: bundle)
    }

    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override func loadView() {
        self.setupViewElements()
        
        let view = UIView(frame: UIScreen.mainScreen().applicationFrame)
        view.backgroundColor = UIColor.whiteColor()

        view.addSubview(self.nameLabel)
        view.addSubview(self.name)

        view.addSubview(self.priceLabel)
        view.addSubview(self.price)

        view.addSubview(self.numberLabel)
        view.addSubview(self.number)

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let add = UIBarButtonItem(title:"Add", style: UIBarButtonItemStyle.Bordered, target:self, action:"add")
        self.navigationItem.rightBarButtonItem = add
    }

    override func didReceiveMemoryWarning() {  
      super.didReceiveMemoryWarning()
    }

    func add() {
        let stock = Stock(name: self.name.text, price: (self.price.text as NSString).floatValue, number: self.number.text.toInt()!)
        let store = StockStore.sharedInstance
        store.add(stock)
        self.navigationController.popViewControllerAnimated(true)
    }

    func setupViewElements() {
        var rect = CGRect(x: 10, y: 92, width: 120, height: 15)
        var textRect = CGRect(x: 110, y: 80, width: 200, height: 40)
        self.nameLabel = self.newStockLabel(rect, text: "Stock name: ")
        self.name = self.newStockField(textRect, placeholder: "Name", type: UIKeyboardType.Default)
        
        rect.origin.y += 50
        textRect.origin.y += 50
        self.priceLabel = self.newStockLabel(rect, text: "Stock price: ")
        self.price = self.newStockField(textRect, placeholder: "Price", type: UIKeyboardType.DecimalPad)

        rect.origin.y += 50
        textRect.origin.y += 50
        self.numberLabel = self.newStockLabel(rect, text: "Number: ")
        self.number = self.newStockField(textRect, placeholder: "Num", type: UIKeyboardType.NumberPad)

    }
    
    func newStockLabel(frame: CGRect, text: String) -> UILabel {
        let label = UILabel(frame: frame)
        label.text = text
        label.font = UIFont.boldSystemFontOfSize(15.0)
        label.textColor = UIColor.blackColor()
        return label
    }

    func newStockField(frame: CGRect, placeholder: String, type: UIKeyboardType) -> UITextField {
        let newStockField = UITextField(frame: frame)
        newStockField.borderStyle = UITextBorderStyle.RoundedRect
        newStockField.font = UIFont.systemFontOfSize(15)
        newStockField.placeholder = placeholder
        newStockField.autocorrectionType = UITextAutocorrectionType.No
        newStockField.keyboardType = type
        newStockField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        return newStockField
    }

}

