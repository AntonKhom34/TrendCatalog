//
//  SearchListPresenterProtocol.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol SearchListPresenterProtocol {
    
    // MARK: - Signals from View
    
    func getBuildingItem(atIndex: Int) -> BuildingResultProtocol
    func getBuildingItemsCount() -> Int
    func onViewWillAppear()
    func onLoadTenButtonTapped()
    func onSortChangedWithType(_ type: SortType)
}
