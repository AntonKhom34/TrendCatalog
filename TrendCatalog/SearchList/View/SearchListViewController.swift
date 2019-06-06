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
            
//            commentCell.setDeadline(building.deadline)
            
            commentCell.setInfoAboutBuildingComplex(name: building.region.name,
                                                    developer: building.builder.name,
                                                    complexName: building.name,
                                                    subwaysName: building.subways[0].name,
                                                    subwaysDistanceTiming: building.subways[0].distance_timing,
                                                    subwaysDistanceType: building.subways[0].distance_type,
                                                    imageName: building.image)
            
            commentCell.setNullApartment(nullApartment: building.min_prices[0].rooms,
                                         nullApartmentCost: building.min_prices[0].price)
            
            switch building.min_prices.count {
            case 1:
                commentCell.setNullApartment(nullApartment: building.min_prices[0].rooms,
                                             nullApartmentCost: building.min_prices[0].price)
            case 2:
                commentCell.setNullApartment(nullApartment: building.min_prices[0].rooms,
                                             nullApartmentCost: building.min_prices[0].price)
                commentCell.setFirstRoomApartment(firstRoomApartment: building.min_prices[1].rooms,
                                                  firstRoomApartmentCost: building.min_prices[1].price)
            case 3:
                commentCell.setNullApartment(nullApartment: building.min_prices[0].rooms,
                                             nullApartmentCost: building.min_prices[0].price)
                commentCell.setFirstRoomApartment(firstRoomApartment: building.min_prices[1].rooms,
                                                  firstRoomApartmentCost: building.min_prices[1].price)
                commentCell.setSecondRoomApartment(secondRoomApartment: building.min_prices[2].rooms,
                                                   secondRoomApartmentCost: building.min_prices[2].price)
            default:
                commentCell.setNullApartment(nullApartment: building.min_prices[0].rooms,
                                             nullApartmentCost: building.min_prices[0].price)
                commentCell.setFirstRoomApartment(firstRoomApartment: building.min_prices[1].rooms,
                                                  firstRoomApartmentCost: building.min_prices[1].price)
                commentCell.setSecondRoomApartment(secondRoomApartment: building.min_prices[2].rooms,
                                                   secondRoomApartmentCost: building.min_prices[2].price)
                commentCell.setThirdRoomApartment(thirdRoomApartment: building.min_prices[3].rooms,
                                                  thirdRoomApartmentCost: building.min_prices[3].price)
            }
        }
        
        return cell
    }
    
}

extension SearchListViewController: SearchListViewProtocol {
}
