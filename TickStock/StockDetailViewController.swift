//bs
//  StockDetailViewController.swift
//  TickStock
//
//  Created by Jacob O'Donnell on 8/16/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import UIKit

class StockDetailViewController: UIViewController {
    var stock: Stock?
    override init(nibName: String!, bundle: NSBundle!) {
        super.init(nibName: nibName, bundle: bundle)
    }

    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override func loadView() {
        let view = UIView(frame: UIScreen.mainScreen().applicationFrame)
        view.backgroundColor = UIColor.whiteColor()

        var textRect = CGRect(x: 110, y: 80, width: 200, height: 40)
        view.addSubview(self.newStockLabel(textRect, text: self.stock!.name))

        textRect.origin.y += 50
        view.addSubview(self.newStockLabel(textRect, text: String(format: "%@%.2f", "", self.stock!.price)))

        textRect.origin.y += 50
        view.addSubview(self.newStockLabel(textRect, text: "\(self.stock!.number)"))

        textRect.origin.y += 50
        view.addSubview(self.newStockLabel(textRect, text: String(format: "%@%.2f", "", (self.stock!.total()))))

        textRect.origin.y += 50
        let button = UIButton()
        button.addTarget(self, action:"delete", forControlEvents:.TouchUpInside)
        button.setTitle("Delete", forState:.Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        button.frame = textRect
        view.addSubview(button)
        
        self.view = view
    }

    func newStockLabel(frame: CGRect, text: String) -> UILabel {
        let label = UILabel(frame: frame)
        label.text = text
        label.font = UIFont.boldSystemFontOfSize(15.0)
        label.textColor = UIColor.blackColor()
        return label
    }

    func delete() {
        StockStore.sharedInstance.remove(self.stock!)
        self.navigationController.popViewControllerAnimated(true)
    }
}

