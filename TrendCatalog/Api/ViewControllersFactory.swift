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
        
        let view: SearchListViewController = SearchListViewController()
        let dataProvider: SearchListDataProviderProtocol = SearchListDataProvider()
        //let storyImagesDownloader: ImagesDownloaderProtocol = ImagesDownloader()
        let presenter = SearchListPresenter(view: view,
                                         searchListDataProvider: dataProvider)
                                         /*storyImagesDownloader: storyImagesDownloader*/
        view.presenter = presenter
        
        return view
    }
    
}
