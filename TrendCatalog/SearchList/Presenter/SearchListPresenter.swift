//
//  SearchListPresenter.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class SearchListPresenter: SearchListPresenterProtocol {
    static var visibleBuildings: Int = 10
    
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
    
// MARK: - Public
    
    func getBuildingItemsCount() -> Int {
        return buildingResult.count
    }
    
    func getBuildingItem(atIndex: Int) -> BuildingResultProtocol? {
        
        if 0 <= atIndex && atIndex < buildingResult.count {
            return buildingResult[atIndex]
        }
        
        return nil
    }
    
    func getModel() {
        self.buildingResult = self.buildings.getModelBuildings(count: SearchListPresenter.visibleBuildings)
        SearchListPresenter.visibleBuildings = SearchListPresenter.visibleBuildings + 10
    }
    
}
