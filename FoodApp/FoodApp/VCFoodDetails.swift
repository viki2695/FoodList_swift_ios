//
//  VCFoodDetails.swift
//  FoodApp
//
//  Created by vigneswaran on 21/02/18.
//  Copyright © 2018 vigneswaran. All rights reserved.
//

import UIKit

class VCFoodDetails: UIViewController {

    @IBOutlet weak var iv_FoodImage: UIImageView!
    @IBOutlet weak var la_FoodName: UILabel!
    @IBOutlet weak var ls_FoodDes: UITextView!
    
    var food:Food?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        la_FoodName.text = food?.name!
        ls_FoodDes.text = food?.des!
        iv_FoodImage.image = UIImage(named: (food?.image!)!)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
