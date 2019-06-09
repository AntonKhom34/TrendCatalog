//
//  DropdownMenuPresenterProtocol.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 09/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol DropdownMenuPresenterProtocol: class {
    func getPriceListCount() -> Int
    func getPriceList() -> [Int]
    func tapedPriceFromOrTo(priceFromOrTo: Int)
}
