//
//  HitTestTableViewController.swift
//  UITextViewLinkClick
//
//  Created by acumen on 2017/12/4.
//  Copyright © 2017年 acumen. All rights reserved.
//

import UIKit

class NormalTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = "\(NormalTableViewCell.classForCoder())"
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: nibName)
        tableView.rowHeight = 80
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension NormalTableViewController: UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NormalTableViewCell.classForCoder())", for: indexPath) as! NormalTableViewCell
        cell.renderTextView(text: "轻触并按压 http://www.baidu.com ")
        return cell
    }
}
