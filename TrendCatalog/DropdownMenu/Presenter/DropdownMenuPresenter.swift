//
//  DropdownMenuPresenter.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 09/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class DropdownMenuPresenter {
    
    // MARK: - Properties
    
    weak var searchListView: SearchListViewController?
    unowned var view: DropdownMenuTableViewProtocol
    var priceList: [Int]
    
    init(view: DropdownMenuTableViewProtocol, priceList: [Int],
         searchList: SearchListViewController) {
        self.view = view
        self.priceList = priceList
        self.searchListView = searchList
    }
}

// MARK: - Extension

extension DropdownMenuPresenter: DropdownMenuPresenterProtocol {
    
    func getPriceListCount() -> Int {
        return priceList.count
    }
    
    func getPriceList() -> [Int] {
        return priceList
    }
    
    func tapedPriceFromOrTo(priceFromOrTo: Int) {
        
        if searchListView?.priceType == PriceType.typePriceFrom {
            searchListView?.priceFrom = String(priceFromOrTo)
            searchListView?.setupPriceListTo(priceFromOrTo)
            searchListView?.priceFromLabel.text = "от \(priceFromOrTo.millons) \(priceFromOrTo.thousands / 100)00 000 руб."
            searchListView?.presenter.onSortChangedWithType(.price,
                                                            priceFrom: String(priceFromOrTo),
                                                            priceTo: searchListView?.priceTo ?? "")
            
        } else {
            searchListView?.priceTo = String(priceFromOrTo)
            searchListView?.priceToLabel.text = "до \(priceFromOrTo.millons) \(priceFromOrTo.thousands / 100)00 000 руб."
            searchListView?.presenter.onSortChangedWithType(.price,
                                                            priceFrom: searchListView?.priceFrom ?? "",
                                                            priceTo: String(priceFromOrTo))
            
        }
        
    }
}
