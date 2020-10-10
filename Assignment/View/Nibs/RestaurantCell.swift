//
//  RestaurantCell.swift
//  Assignment
//
//  Created by Ankur on 25/08/20.
//  Copyright © 2020 Ankur. All rights reserved.
//

import UIKit

class RestaurantCell: UICollectionViewCell
{
    @IBOutlet private weak var restrImageView: UIImageView!
    @IBOutlet private weak var restrNameLbl: UILabel!
    @IBOutlet private weak var ratingLbl: UILabel!
    @IBOutlet private weak var deliveryTimeLbl: UILabel!
    @IBOutlet private weak var crossLbl: UILabel!
    @IBOutlet private weak var offersLbl: UILabel!
    @IBOutlet private weak var discountImageWidthConst: NSLayoutConstraint!
    @IBOutlet private weak var offerLblLeadingConst: NSLayoutConstraint!
    
    //when this value is true, we need to show discount label else catergory
    var isDiscountLabel: Bool!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    var setData: RestaurantDetailModel!
    {
        didSet
        {
            restrImageView.downloaded(from: "https://appgrowthcompany.com:3000\(setData.image)")
            restrNameLbl.text = setData.name
            ratingLbl.text = setData.ratings.description + "(" + setData.ratingCount.description + ")"
            deliveryTimeLbl.text = setData.avgDeliveryTime.description + "Min"
            crossLbl.text = setData.outletSize.description
            setOffersLabel(setData.discount.description, setData.discountUpto.description, true, setData.getCategory())
        }
    }
    
    //MARK:- Offers label/category label
    private func setOffersLabel(_ offerText: String,_ discUpTo: String,_ isDiscount: Bool,_ category: String )
    {
        if isDiscountLabel
        {
            discountImageWidthConst.constant = 16
            offerLblLeadingConst.constant = 6
            offersLbl.textColor = #colorLiteral(red: 0.2474749982, green: 0.5998857617, blue: 0.003553132294, alpha: 1)
            offersLbl.text = offerText + "% Off valid upto KES " + discUpTo
        }
        else
        {
            discountImageWidthConst.constant = 0
            offerLblLeadingConst.constant = 0
            offersLbl.textColor = .black
            offersLbl.text = category
        }
    }
}
