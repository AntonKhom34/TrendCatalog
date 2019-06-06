//
//  SearchListDataProvider.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class SearchListDataProvider {
    
    private var service: ApiServiesProtocol

    init(service: ApiServiesProtocol) {
        self.service = service
    }
}

extension SearchListDataProvider: SearchListDataProviderProtocol {
    
    func getBuildings(offset: Int, count: Int, sortType: String,
                      onComplete: @escaping ([BuildingResult]) -> ()) {
        service.getBuildings(offset: offset, count: count, sortType: sortType, onComplete: onComplete)
    }
}
