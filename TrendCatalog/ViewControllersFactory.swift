//
//  ViewControllersFactory.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class ViewControllersFactory {
    
    static func makeSearchListViewController() -> UIViewController {
        
        let view = SearchListViewController()
        let presenter = SearchListPresenter(view: view,
                                            provider: SearchListDataProvider(service: ApiServies()))
        view.presenter = presenter
        
        return view
    }
    
}
