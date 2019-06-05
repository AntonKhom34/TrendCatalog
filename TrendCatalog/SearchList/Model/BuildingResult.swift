//
//  BuildingResult.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

struct BuildingResult: BuildingResultProtocol, Codable {
    var min_prices: [BuildingMinPrice]?
    var subways: [BuildingSubways]
    var name: String
//    var deadline: String?
    var builder: BuildingBuilder
    var image: URL
    var region: BuildingRegion
}
