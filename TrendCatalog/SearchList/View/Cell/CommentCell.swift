//
//  CommentCell.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var сomplexNameLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!
    @IBOutlet weak var subwaysLabel: UILabel!
    @IBOutlet weak var developerLabel: UILabel!
    @IBOutlet weak var regionNameLabel: UILabel!
    @IBOutlet weak var rootImage: UIImageView!
    
    @IBOutlet weak var nullRoomApartmentNameLabel: UILabel!
    @IBOutlet weak var nullRoomApartmentFromLabel: UILabel!
    @IBOutlet weak var nullRoomApartmentMillionsLabel: UILabel!
    @IBOutlet weak var nullRoomApartmentThousandsLabel: UILabel!
    @IBOutlet weak var nullRoomApartmentHundredsLabel: UILabel!
    @IBOutlet weak var nullRoomApartmentRubLabel: UILabel!
    
    @IBOutlet weak var firstRoomApartmentNameLabel: UILabel!
    @IBOutlet weak var firstRoomApartmentFromLabel: UILabel!
    @IBOutlet weak var firstRoomApartmentMillionsLabel: UILabel!
    @IBOutlet weak var firstRoomApartmentThousandsLabel: UILabel!
    @IBOutlet weak var firstRoomApartmentHundredsLabel: UILabel!
    @IBOutlet weak var firstRoomApartmentRubLabel: UILabel!
    
    @IBOutlet weak var secondRoomApartmentNameLabel: UILabel!
    @IBOutlet weak var secondRoomApartmentFromLabel: UILabel!
    @IBOutlet weak var secondRoomApartmentMillionsLabel: UILabel!
    @IBOutlet weak var secondRoomApartmentThousandsLabel: UILabel!
    @IBOutlet weak var secondRoomApartmentHundredsLabel: UILabel!
    @IBOutlet weak var secondRoomApartmentRubLabel: UILabel!
    
    @IBOutlet weak var thirdRoomApartmentNameLabel: UILabel!
    @IBOutlet weak var thirdRoomApartmentFromLabel: UILabel!
    @IBOutlet weak var thirdRoomApartmentMillionsLabel: UILabel!
    @IBOutlet weak var thirdRoomApartmentThousandsLabel: UILabel!
    @IBOutlet weak var thirdRoomApartmentHundredsLabel: UILabel!
    @IBOutlet weak var thirdRoomApartmentRubLabel: UILabel!

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
        nullRoomApartmentNameLabel.text = nullApartment
        nullRoomApartmentFromLabel.text = "от "
        nullRoomApartmentMillionsLabel.text = millionFormat(nullApartmentCost.millons)
        nullRoomApartmentThousandsLabel.text = manyFormat(nullApartmentCost.thousands)
        nullRoomApartmentHundredsLabel.text = manyFormat(nullApartmentCost.hundreds)
        nullRoomApartmentRubLabel.text = "руб."
    }
    
    func setFirstRoomApartment(firstRoomApartment: String,
                               firstRoomApartmentCost: Int)  {
        firstRoomApartmentNameLabel.text = firstRoomApartment
        firstRoomApartmentFromLabel.text = "от "
        firstRoomApartmentMillionsLabel.text = millionFormat(firstRoomApartmentCost.millons)
        firstRoomApartmentThousandsLabel.text = manyFormat(firstRoomApartmentCost.thousands)
        firstRoomApartmentHundredsLabel.text = manyFormat(firstRoomApartmentCost.hundreds)
        firstRoomApartmentRubLabel.text = "руб."
    }
    
    func setSecondRoomApartment(secondRoomApartment: String,
                                secondRoomApartmentCost: Int)  {
        secondRoomApartmentNameLabel.text = secondRoomApartment
        secondRoomApartmentFromLabel.text = "от "
        secondRoomApartmentMillionsLabel.text = millionFormat(secondRoomApartmentCost.millons)
        secondRoomApartmentThousandsLabel.text = manyFormat(secondRoomApartmentCost.thousands)
        secondRoomApartmentHundredsLabel.text = manyFormat(secondRoomApartmentCost.hundreds)
        secondRoomApartmentRubLabel.text = "руб."
    }
    
    func setThirdRoomApartment(thirdRoomApartment: String,
                               thirdRoomApartmentCost: Int)  {
        thirdRoomApartmentNameLabel.text = thirdRoomApartment
        thirdRoomApartmentFromLabel.text = "от "
        thirdRoomApartmentMillionsLabel.text = millionFormat(thirdRoomApartmentCost.millons)
        thirdRoomApartmentThousandsLabel.text = manyFormat(thirdRoomApartmentCost.thousands)
        thirdRoomApartmentHundredsLabel.text = manyFormat(thirdRoomApartmentCost.hundreds)
        thirdRoomApartmentRubLabel.text = "руб."
    }
    
    // MARK: - Private
    
    func manyFormat(_ many: Int) -> String {
        if many == 0 {
            return "000"
        } else if many / 10 == 0 {
            return "00\(many)"
        } else if many / 100 == 0 {
            return "0\(many)"
        }
        return "\(many)"
    }
    
    func millionFormat(_ million: Int) -> String {
        if million == 0 {
            return ""
        }
        return String(million)
    }
    
}

// MARK: - Extensions

extension CommentCell {
    static let nibName = "CommentCell"
}
