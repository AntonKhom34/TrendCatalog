//
//  SearchListPresenter.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

enum SortType: String {
    case price
    case region
    case subway

    var key: String {
        return self.rawValue
    }
}

class SearchListPresenter {
    private let packBuildingsCount = 10
    private let startBuildingsCount = 10

    private var buildings: [BuildingResult]
    private var provider: SearchListDataProviderProtocol
    private var sortType: SortType
    
    unowned var view: SearchListViewProtocol
    
    
    init(view: SearchListViewProtocol,
         provider: SearchListDataProviderProtocol) {
        
        self.view = view
        self.provider = provider
        buildings = []
        sortType = .price
    }
    
}

// MARK: - SearchListPresenterProtocol

extension SearchListPresenter: SearchListPresenterProtocol  {

    func getBuildingItemsCount() -> Int {
        return buildings.count
    }

    func getBuildingItem(atIndex: Int) -> BuildingResultProtocol {
        guard atIndex >= 0, atIndex < buildings.count else {
            fatalError("Could not get building with index: \(atIndex)")
        }

        return buildings[atIndex]
    }

    func onViewWillAppear() {
        initStartBuildings()
    }
    
    func onLoadTenButtonTapped() {
        view.startPreloader()
        provider.getBuildings(offset: buildings.count,
                              count: packBuildingsCount,
                              sortType: sortType.key) { [weak self] buildings in
            guard let strongSelf = self else {
                return
            }
        
            strongSelf.view.stopPreloader()
            strongSelf.buildings.append(contentsOf: buildings)
            strongSelf.view.reloadTable()
        }
    }

    func onSortChangedWithType(_ type: SortType) {
        sortType = type
        initStartBuildings()
    }

    // MARK: - Private

    private func initStartBuildings() {
        view.startPreloader()
        provider.getBuildings(offset: 0, count: startBuildingsCount, sortType: sortType.key) { [weak self] buildings in
            guard let strongSelf = self else {
                return
            }
            strongSelf.view.stopPreloader()
            strongSelf.buildings = buildings
            strongSelf.view.reloadTable()
        }
    }
}
