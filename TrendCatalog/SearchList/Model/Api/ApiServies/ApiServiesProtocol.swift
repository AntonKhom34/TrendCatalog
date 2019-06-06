//
//  ApiServiesProtocol.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 06/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol ApiServiesProtocol {
    
    func getBuildings(offset: Int, count: Int, sortType: String, onComplete: @escaping ([BuildingResult]) -> Void)
}
