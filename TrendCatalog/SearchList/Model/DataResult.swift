//
//  DataResult.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

struct DataResult: Codable {
    var buildings: [BuildingResult]
    
    enum CodingKeys: String, CodingKey {
        case buildings = "results"
    }
}
