//
//  ViewController.swift
//  FoodApp
//
//  Created by vigneswaran on 21/02/18.
//  Copyright © 2018 vigneswaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var listOfFood = [Food]()
    
    @IBOutlet weak var cvListOfFood: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFoodFromPropertyList()
        
        cvListOfFood.delegate = self
        cvListOfFood.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfFood.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellFood:CVCFood = collectionView.dequeueReusableCell(withReuseIdentifier: "cellFood", for: indexPath) as! CVCFood
        cellFood.setFood(food: listOfFood[indexPath.row])
        return cellFood
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: listOfFood[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetails" {
            if let des = segue.destination as? VCFoodDetails{
                if let food = sender as? Food {
                    des.food = food
                }
            }
        } 
    }
    
    func loadFoodFromPropertyList(){
        let path = Bundle.main.path(forResource: "Foods", ofType: "plist")! as String
        
        let url = URL(fileURLWithPath: path)
        
        do{
            let data = try Data(contentsOf: url)
            let plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
            let dicArray = plist as! [[String : String]]
            
            for food in dicArray{
                print(food["Name"]!)
                listOfFood.append(Food(name: food["Name"]!, des:food["Des"]!, image: food["Image"]))
            }
        }catch{
            print("Sorry I cant print anything")
        }
    }
}

