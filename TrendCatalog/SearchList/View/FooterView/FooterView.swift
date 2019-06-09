//
//  FooterView.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 09/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class FooterView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var loadTenButton: UIButton!
    
    weak var viewSearchList: SearchListViewController?

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - Private
    
    private func commonInit() {
        Bundle.main.loadNibNamed("FooterView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    // MARK: - Events
    
    @IBAction func tapedLoadTenButton(_ sender: Any) {
        viewSearchList?.tapedLoadTenButton(priceFrom: viewSearchList?.priceFrom ?? "",
                                           priceTo: viewSearchList?.priceTo ?? "")
    }
    
}
