//
//  DropdownMenuTableViewController.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 09/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class DropdownMenuTableViewController: UITableViewController {
    var priceList: [Int] = []
    
    // MARK: - Properties
    
    var presenter: DropdownMenuPresenterProtocol!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        priceList = presenter.getPriceList()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getPriceListCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(priceList[indexPath.row].millons) \(priceList[indexPath.row].thousands / 100)00 000 руб."
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.popViewController(animated: false)
        dismiss(animated: true, completion: nil)
        presenter.tapedPriceFromOrTo(priceFromOrTo: priceList[indexPath.row])
    }
    
}

extension DropdownMenuTableViewController: DropdownMenuTableViewProtocol {
}
