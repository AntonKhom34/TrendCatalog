//
//  ApiServies.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class ApiServies {
    private let apiUrl = "http://api.trend-dev.ru/v3_1"
}

extension ApiServies: ApiServiesProtocol {
    
    func getBuildings(offset: Int, count: Int, sortType: String,
                      priseFrom: String, priceTo: String,
                      onComplete: @escaping ([BuildingResult]) -> Void) {
        let urlString = "\(apiUrl)/blocks/search?show_type=list&count=\(count)&offset=\(offset)&sort=\(sortType)&price_from=\(priseFrom)&price_to=\(priceTo)"
        guard let url = URL(string: urlString) else {
            return
        }
        
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
}
