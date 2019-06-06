//
//  BuildingResultProtocol.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 05/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol BuildingResultProtocol {
    var image: URL { get }
    var region: BuildingRegion { get }
    var name: String { get }
//    var deadline: String { get }
    var subways: [BuildingSubways] { get }
    var min_prices: [BuildingMinPrice] { get }
    var builder: BuildingBuilder { get }
}
