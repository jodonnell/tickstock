//
//  ViewController.swift
//  TickStock
//
//  Created by Jacob O'Donnell on 8/13/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
                            

    override func loadView() {
        self.tableView = UITableView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let newStockButton = UIBarButtonItem(title:"Add new stock", style: UIBarButtonItemStyle.Bordered, target:self, action:"newStock")
        self.navigationItem.rightBarButtonItem = newStockButton

        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }

    // override func viewDidLoad() {
    //     self.super()
    //      CGFloat x = 0
    //      CGFloat y = 50
    //      CGFloat width = self.view.frame.size.width
    //      CGFloat height = self.view.frame.size.height - 50
    //      CGRect tableFrame = CGRectMake(x, y, width, height);

    //     self.tableView = UITableView(tableFrame, style: UITableViewStyle.Plain)
    // }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func newStock() {
        let vc = AddNewStockViewController(nibName: nil, bundle: nil)
        self.navigationController.pushViewController(vc, animated:true)
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return StockStore.sharedInstance.all().count
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel.text = StockStore.sharedInstance.all()[indexPath.row].name
        return cell
    }

    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        let vc = StockDetailViewController(nibName: nil, bundle: nil)
        vc.stock = StockStore.sharedInstance.all()[indexPath.row]
        self.navigationController.pushViewController(vc, animated:true)
    }
}

