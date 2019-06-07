//
//  ExtensionInt.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 07/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

extension Int {
    var millons: Int {
        return self / 1000000
    }
    var thousands: Int {
        return self / 1000 - ((self / 1000000) * 1000)
    }
    var hundreds: Int {
        return self % 1000
    }

}
