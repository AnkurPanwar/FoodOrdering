//
//  RestrLstTableViewCell.swift
//  Assignment
//
//  Created by Ankur on 25/08/20.
//  Copyright © 2020 Ankur. All rights reserved.
//

import UIKit

class RestrLstTableViewCell: UITableViewCell
{
    @IBOutlet weak var restaurantCollectionView: UICollectionView!
    private var restrData: RestrDataModel!
    var tableIndex: Int!
    func setData(_ tableIndex: Int,_ data: RestrDataModel)
    {
        self.tableIndex = tableIndex
        restrData = data
        restaurantCollectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        restaurantCollectionView.dataSource = self
        
        let foodCatCell = UINib(nibName: "FoodCategoryCell", bundle: nil)
        restaurantCollectionView.register(foodCatCell, forCellWithReuseIdentifier: "FoodCategoryCell")
        
        let restrCell = UINib(nibName: "RestaurantCell", bundle: nil)
        restaurantCollectionView.register(restrCell, forCellWithReuseIdentifier: "RestaurantCell")
        
    }
}

extension RestrLstTableViewCell: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if tableIndex == 0
        {
            return restrData.categories.count
        }
        if tableIndex == 1
        {
            return restrData.saved.count
        }
        else if tableIndex == 2
        {
            return restrData.bestOffers.count
        }
        else if tableIndex == 3
        {
            return restrData.recommended.count
        }
        else
        {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if tableIndex == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCategoryCell", for: indexPath) as! FoodCategoryCell
            cell.setData = restrData.categories[indexPath.row]
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
            if tableIndex == 1
            {
                cell.isDiscountLabel = false
                cell.setData = restrData.saved[indexPath.row]
            }
            else if tableIndex == 2
            {
                cell.isDiscountLabel = true
                cell.setData = restrData.bestOffers[indexPath.row]
            }
            else if tableIndex == 3
            {
                cell.isDiscountLabel = false
                cell.setData = restrData.recommended[indexPath.row]
            }
            return cell
        }
    }
}
