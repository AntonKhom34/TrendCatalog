//
//  SearchListDataProviderProtocol.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol SearchListDataProviderProtocol {
    
    func getBuildings(offset: Int, count: Int, sortType: String,
                      priseFrom: String, priceTo: String,
                      onComplete: @escaping ([BuildingResult]) -> ())
}
