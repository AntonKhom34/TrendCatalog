//
//  SearchDataResult.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

struct SearchDataResult: Codable {
    var data: DataResult
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}
