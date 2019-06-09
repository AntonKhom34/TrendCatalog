//
//  SearchListViewController.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit
import MBProgressHUD

enum PriceType: String {
    case typePriceFrom
    case typePriceTo
    
    var key: String {
        return self.rawValue
    }
}

class SearchListViewController: UIViewController {
    private let footerHeight: CGFloat = 60
    private let footerButtonBorderWidth: CGFloat = 1
    private var priceListFrom: [Int] = []
    private var priceListTo: [Int] = []
    var priceType: PriceType = .typePriceFrom
    
    private static let commentCellId = "commentCell"

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var priceFromButton: UIButton!
    @IBOutlet weak var priceToButton: UIButton!
    @IBOutlet weak var priceFromLabel: UILabel!
    @IBOutlet weak var priceToLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Properties
    
    var presenter: SearchListPresenterProtocol!
    var priceFrom = ""
    var priceTo = ""

    // MARK: - Override
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupPriceListFromAndTo()
        setupLabel()
        setupLogoImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        presenter.onViewWillAppear(priceFrom: priceFrom, priceTo: priceTo)
    }
    
    // MARK: - Events
    
    @IBAction func tapedSortedPrice(_ sender: Any) {
        presenter.onSortChangedWithType(.price, priceFrom: priceFrom, priceTo: priceTo)
    }
    @IBAction func tapedSortedRegion(_ sender: Any) {
        presenter.onSortChangedWithType(.region, priceFrom: priceFrom, priceTo: priceTo)
    }
    @IBAction func tapedSortedSubways(_ sender: Any) {
        presenter.onSortChangedWithType(.subway, priceFrom: priceFrom, priceTo: priceTo)
    }
    @IBAction func tapedPriceFromButton(_ sender: Any) {
        priceType = .typePriceFrom
        let viewController = ViewControllersFactory.makeDropDownMenu(priceListFrom,
                                                                     searchList: self)
        makeDropDownTable(viewController, self.priceFromButton)
    }
    @IBAction func tapedPricrToButton(_ sender: Any) {
        priceType = .typePriceTo
        let viewController = ViewControllersFactory.makeDropDownMenu(priceListTo,
                                                                     searchList: self)
        makeDropDownTable(viewController, self.priceToButton)
    }

    // MARK: - Private
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: CommentCell.nibName, bundle: nil),
                           forCellReuseIdentifier: SearchListViewController.commentCellId)
        tableView.separatorColor = UIColor.clear
        setupFooterTableView()
    }
    
    func makeDropDownTable(_ vc: UIViewController ,_ button: UIButton) {
        
        vc.modalPresentationStyle = .popover
        let popOverVC = vc.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.sourceView = button
        popOverVC?.sourceRect = CGRect(x: button.bounds.midX, y: button.bounds.maxY,
                                       width: 0, height: 0)
        vc.preferredContentSize = CGSize(width: 180, height: 250)
        
        self.present(vc, animated: true)
        
    }
    
    func setupPriceListFromAndTo() {
        for index in 0...9 {
        priceListFrom += [1000000 + index * 500000]
        priceListTo += [1500000 + index * 500000]
        }
    }
    
    func setupLabel() {
        priceFromLabel.text = "Цена от"
        priceToLabel.text = "Цена до"
    }
    
    func setupLogoImage() {
        logoImageView.image = UIImage(named: "Trend")
        logoImageView.contentMode = .scaleAspectFill
    }
    
    // MARK: - Public
    
    func setupPriceListTo(_ from: Int) {
        for index in 0...9 {
        priceListTo[index] = from + 500000 + index * 500000
        }
    }
    
    // MARK: - FooterTableVie
    
    func setupFooterTableView() {
        let viewFooterView = FooterView()
        viewFooterView.sizeToFit()
        viewFooterView.frame.size.height = footerHeight
        viewFooterView.viewSearchList = self
        
        viewFooterView.loadTenButton.layer.borderWidth = footerButtonBorderWidth
        viewFooterView.loadTenButton.layer.borderColor = UIColor.black.cgColor
        
        tableView.tableFooterView = viewFooterView
    }
    
}

// MARK: - UITableViewDataSource

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

        let building = presenter.getBuildingItem(atIndex: indexPath.row)
        //            commentCell.setDeadline(building.deadline)
        
        commentCell.setInfoAboutBuildingComplex(name: building.region.name,
                                                developer: building.builder.name,
                                                complexName: building.name,
                                                subwaysName: building.subways[0].name,
                                                subwaysDistanceTiming: building.subways[0].distance_timing,
                                                subwaysDistanceType: building.subways[0].distance_type,
                                                imageName: building.image)
        
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
        
        return cell
    }
    
}

// MARK: - SearchListViewProtocol

extension SearchListViewController: SearchListViewProtocol {
    
    func reloadTable() {
        tableView.reloadData()
    }

    func startPreloader() {
        MBProgressHUD.showAdded(to: view, animated: true).isUserInteractionEnabled = true
        tableView.tableFooterView?.isHidden = true
    }

    func stopPreloader() {
        MBProgressHUD.hide(for: view, animated: true)
        tableView.tableFooterView?.isHidden = false
    }
    
    func tapedLoadTenButton(priceFrom: String, priceTo: String) {
        presenter.onLoadTenButtonTapped(priceFrom: priceFrom, priceTo: priceTo)
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension SearchListViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
