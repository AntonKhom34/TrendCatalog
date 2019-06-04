//
//  SearchListPresenter.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class SearchListPresenter: SearchListPresenterProtocol {
    
    unowned var view: SearchListViewProtocol
    
    private var searchListDataProvider: SearchListDataProviderProtocol
    
    init(view: SearchListViewProtocol,
         searchListDataProvider: SearchListDataProviderProtocol) {
        
        self.view = view
        
        self.searchListDataProvider = searchListDataProvider
    }
}
