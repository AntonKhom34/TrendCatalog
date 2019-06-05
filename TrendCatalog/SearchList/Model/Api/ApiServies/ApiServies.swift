//
//  ApiServies.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class ApiServies {
    private var buildings: [BuildingResult] = []
    
// MARK: - Private
    
    func getBuildings(count: Int, onComplete: @escaping ([BuildingResult]) -> Void) {
        
        guard let url = URL(string: "http://api.trend-dev.ru/v3_1/blocks/search?show_type=list&count=\(count)&offset=1")
            else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    onComplete([])
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    onComplete([])
                }
                return
            }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchDataResult.self, from: data)
                DispatchQueue.main.async {
                    onComplete(searchResult.data.buildings)
                }
            } catch {
                DispatchQueue.main.async {
                    onComplete([])
                }
            }
        }
        task.resume()
    }
    
// MARK: - Public
    
    internal func setModelBuildings(count: Int) {
        getBuildings(count: count) { [weak self] buildings in
            guard let strongSelf = self else {
                return
            }
            strongSelf.buildings = buildings
        }
    }
    
}
