//
//  SearchListViewController.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class SearchListViewController: UIViewController {    
    @IBAction func reloadTab(_ sender: Any) {
        tableView.reloadData()
    }
    
    fileprivate static let commentCellId = "commentCell"
    
    var presenter: SearchListPresenterProtocol!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.register(UINib(nibName: CommentCell.nibName, bundle: nil),
                           forCellReuseIdentifier: SearchListViewController.commentCellId)
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
    
}

extension SearchListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getBuildingItemsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchListViewController.commentCellId,
                                                 for: indexPath)
        
        guard let commentCell = cell as? CommentCell else {
            return UITableViewCell(frame: .zero)
        }
        
        if let building = presenter?.getBuildingItem(atIndex: indexPath.row) {
            commentCell.setRegionName(building.region.name)
//            commentCell.setDeadline(building.deadline ?? "Не известно")
            commentCell.setName(building.name)
            commentCell.setDeveloper(building.builder.name)
            commentCell.setSubway("\(building.subways[0].name) \(building.subways[0].distance_timing) мин.")
            commentCell.setImage(imageName: building.image)
            
            commentCell.setNullApartment(nullApartment:
                building.min_prices?[0].rooms ?? "None")
            
            commentCell.setFirstRoomApartment(firstRoomApartment:
                building.min_prices?[1].rooms ?? "None")
            
            commentCell.setSecondRoomApartment(secondRoomApartment:
                building.min_prices?[2].rooms ?? "None")
            
//            commentCell.setThirdRoomApartment(thirdRoomApartment:
//                building.min_prices?[3].rooms ?? "None")
            
            commentCell.setNullApartmentCost(nullApartmentCost:
                building.min_prices?[0].price ?? 0)
            
            commentCell.setFirstRoomApartmentCost(firstRoomApartmentCost:
                building.min_prices?[1].price ?? 0)
            
            commentCell.setSecondRoomApartmentCost(secondRoomApartmentCost:
                building.min_prices?[2].price ?? 0)
            
//            commentCell.setThirdRoomApartmentCost(thirdRoomApartmentCost:
//                building.min_prices?[3].price ?? 0)
        }
        
        return cell
    }
    
}

extension SearchListViewController: SearchListViewProtocol {
}
