//
//  SearchListPresenter.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class SearchListPresenter: SearchListPresenterProtocol {
    static let visibleBuildings: Int = 30
    
    private var buildings = ApiServies()
    
    fileprivate var buildingResult: [BuildingResult]
    
    unowned var view: SearchListViewProtocol
    
    private var searchListDataProvider: SearchListDataProviderProtocol
    
    init(view: SearchListViewProtocol,
         searchListDataProvider: SearchListDataProviderProtocol) {
        
        self.view = view
        self.searchListDataProvider = searchListDataProvider
        self.buildingResult = []
    }
    
    func getBuildingItemsCount() -> Int {
        self.buildingResult = self.buildings.getModelBuildings(count: SearchListPresenter.visibleBuildings)
        return buildingResult.count
    }
    
    func getBuildingItem(atIndex: Int) -> BuildingResultProtocol? {
        
        if 0 <= atIndex && atIndex < buildingResult.count {
            return buildingResult[atIndex]
        }
        
        return nil
    }
}
