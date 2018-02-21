//
//  CVCFood.swift
//  FoodApp
//
//  Created by vigneswaran on 21/02/18.
//  Copyright © 2018 vigneswaran. All rights reserved.
//

import UIKit

class CVCFood: UICollectionViewCell {
    
    
    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var foodLabel: UILabel!
    
    func setFood(food: Food){
        foodImage.image = UIImage(named: food.image!)
        foodLabel.text = food.name!
    }
}
