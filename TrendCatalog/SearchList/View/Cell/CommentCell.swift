//
//  CommentCell.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var сomplexNameLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!
    @IBOutlet weak var subwaysLabel: UILabel!
    @IBOutlet weak var nullRoomApartmentLabel: UILabel!
    @IBOutlet weak var firstRoomApartmentLabel: UILabel!
    @IBOutlet weak var secondRoomApartmentLabel: UILabel!
    @IBOutlet weak var thirdRoomApartmentLabel: UILabel!
    @IBOutlet weak var nullRoomApartmentCostLabel: UILabel!
    @IBOutlet weak var firstRoomApartmentCostLabel: UILabel!
    @IBOutlet weak var secondRoomApartmentCostLabel: UILabel!
    @IBOutlet weak var thirdRoomApartmentCostLabel: UILabel!
    @IBOutlet weak var developerLabel: UILabel!
    @IBOutlet weak var regionNameLabel: UILabel!
    @IBOutlet weak var rootImage: UIImageView!

    // MARK: - Public
    
    func setInfoAboutBuildingComplex(name: String,
                                     developer: String,
                                     complexName: String,
                                     subwaysName: String,
                                     subwaysDistanceTiming: Int,
                                     subwaysDistanceType: String,
                                     imageName: URL) {
        regionNameLabel.text = name
        developerLabel.text = developer
        сomplexNameLabel.text = "ЖК: \(complexName)"
        subwaysLabel.text = "\(subwaysName) \(subwaysDistanceTiming) мин. \(subwaysDistanceType)"
        
        if let data = try? Data(contentsOf: imageName) {
            rootImage.image = UIImage(data: data)
        }
    }
    
    func setNullApartment(nullApartment: String,
                          nullApartmentCost: Int)  {
        nullRoomApartmentLabel.text = nullApartment
        nullRoomApartmentCostLabel.text = "от \(nullApartmentCost) руб."
    }
    
    func setFirstRoomApartment(firstRoomApartment: String,
                               firstRoomApartmentCost: Int)  {
        firstRoomApartmentLabel.text = firstRoomApartment
        firstRoomApartmentCostLabel.text = "от \(firstRoomApartmentCost) руб."
    }
    
    func setSecondRoomApartment(secondRoomApartment: String,
                                secondRoomApartmentCost: Int)  {
        secondRoomApartmentLabel.text = secondRoomApartment
        secondRoomApartmentCostLabel.text = "от \(secondRoomApartmentCost) руб."
    }
    
    func setThirdRoomApartment(thirdRoomApartment: String,
                               thirdRoomApartmentCost: Int)  {
        thirdRoomApartmentLabel.text = thirdRoomApartment
        thirdRoomApartmentCostLabel.text = "от \(thirdRoomApartmentCost) руб."
    }
    
}

extension CommentCell {
    static let nibName = "CommentCell"
}
