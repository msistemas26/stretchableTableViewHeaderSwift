//
//  ViewController.swift
//  StretchableTableViewHeaderSwift
//
//  Created by Raul Humberto Mantilla Assia on 10/19/18.
//  Copyright © 2018 rmantilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIImageView!
    
    struct Constants {
        static let imageSize:CGFloat = 100.0
        static let imageSizeMin:CGFloat = 20.0
        static let imageSizeMax:CGFloat = 600.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }
    
    func setup() {
        tableView.contentInset = UIEdgeInsetsMake(Constants.imageSize, 0, 0, 0)
        headerView.contentMode = .scaleAspectFill
        headerView.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as UITableViewCell
        cell.textLabel?.text = "This is a test"
        return cell
    }
}

extension ViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = Constants.imageSizeMin - (scrollView.contentOffset.y + Constants.imageSizeMin)
        let height = min(max(y, Constants.imageSizeMin), Constants.imageSizeMax)
        headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
}
