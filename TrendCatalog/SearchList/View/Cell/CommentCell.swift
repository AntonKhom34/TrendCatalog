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

    func setRegionName(_ name: String) {
        regionNameLabel.text = name
    }
    
    func setDeveloper(_ developer: String) {
        developerLabel.text = developer
    }
    
    func setDeadline(_ deadline: String) {
        deadlineLabel.text = deadline
    }
    
    func setName(_ name: String) {
        сomplexNameLabel.text = "ЖК: \(name)"
    }
    
    func setSubway(_ subwayName: String) {
        subwaysLabel.text = subwayName
    }
    
    func setImage(imageName: URL) {
        
        if let data = try? Data(contentsOf: imageName) {
            rootImage.image = UIImage(data: data)
        }
    }
    
    func setNullApartment(nullApartment: String)  {
        nullRoomApartmentLabel.text = nullApartment
    }
    
    func setFirstRoomApartment(firstRoomApartment: String)  {
        firstRoomApartmentLabel.text = firstRoomApartment
    }
    
    func setSecondRoomApartment(secondRoomApartment: String)  {
        secondRoomApartmentLabel.text = secondRoomApartment
    }
    
    func setThirdRoomApartment(thirdRoomApartment: String)  {
        thirdRoomApartmentLabel.text = thirdRoomApartment
    }
    
    func setNullApartmentCost(nullApartmentCost: Int)  {
        nullRoomApartmentCostLabel.text = String(nullApartmentCost)
    }
    
    func setFirstRoomApartmentCost(firstRoomApartmentCost: Int)  {
        firstRoomApartmentCostLabel.text = String(firstRoomApartmentCost)
    }
    
    func setSecondRoomApartmentCost(secondRoomApartmentCost: Int)  {
        secondRoomApartmentCostLabel.text = String(secondRoomApartmentCost)
    }
    
    func setThirdRoomApartmentCost(thirdRoomApartmentCost: Int)  {
        thirdRoomApartmentCostLabel.text = String(thirdRoomApartmentCost)
    }
    
}

extension CommentCell {
    static let nibName = "CommentCell"
}
