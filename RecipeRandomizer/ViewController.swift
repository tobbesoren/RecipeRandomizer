//
//  ViewController.swift
//  RecipeRandomizer
//
//  Created by Tobias Sörensson on 2023-03-14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var randomButton: UIButton!
    
    let segueIdGoToAdd = "goToAddRecipe"
    let segueIdGoToRandom = "goToRandomRecipe"
    
    var dishCollection: DishCollection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dishCollection = DishCollection()
        createMockData()
        // Do any additional setup after loading the view.
    }
    
    
    func createMockData() {
        let dish1 = Dish(name: "Lasagne", ingredients: ["Lasagneplattor", "Mjölk", "Smör", "Vetemjöl", "Muskotnöt", "Ost", "Köttfärs", "Krossad tomat", "Lök", "Morot", "Selleri"], instruction: "Gör bechamelsås. Koka ihop köttfärsröra. Varva bechamel, köttfärsröra och lasagneplattor i en form. Gratinera med ost på toppen.", category: "Meat")
        
        let dish2 = Dish(name: "Fiskgratäng", ingredients: ["Fisk", "Potatis", "Smör", "Mjölk", "Dill", "Citron", "Vitt vin", "Ägg", "Riven ost"], instruction: "Gratinera i ugnen.", category: "Sea food")
        
        let dish3 = Dish(name: "Sallad", ingredients: ["Ruccola", "Rödlök", "Tomat", "Valnötter"], instruction: "Blanda allt.", category: "Vegan")
        
        let dish4 = Dish(name: "Boef Bourgoigne", ingredients: ["Nötkött", "Lök", "Morötter", "Champinjoner", "Vin", "Steklök", "Timjan"], instruction: "Koka länge", category: "Meat")
        
        let dish5 = Dish(name: "Grillad kyckling", ingredients: ["Hel kyckling", "Soja", "Olja", "Kryddor", "Olja", "Barbecue-sås"], instruction: "Blanda kryddor och olja. Marinera kycklingen, Grilla i ugnen", category: "Poultry")
        
        let dish6 = Dish(name: "Linssoppa", ingredients: ["Röda linser", "Lök", "Vitlök", "Chili", "Krossade tomater", "Vegansk fond", "Örtkryddor", "Morot"], instruction: "Koka ihop", category: "Vegan")
        
        let dish7 = Dish(name: "Grillade grönsaker med halloumi", ingredients: ["Potatis", "Rödlök", "Morötter", "Broccoli", "Paprika", "Halloumi", "Olja"], instruction: "Rosta i ugn.", category: "Vegetarian")
        
        let dish8 = Dish(name: "Korv stroganof", ingredients: ["Falukorv", "Lök", "Krossad tomat", "Grädde", "Ris"], instruction: "Koka ris. Koka ihop det andra.", category: "Meat")
        
        let dish9 = Dish(name: "Falafel", ingredients: ["Falafelbollar", "Rödlök", "Tomat", "Libabröd", "Dressing", "Sallad"], instruction: "Fritera falafel. Lägg i bröd med grönsaker och dressing.", category: "Vegetarian")
        
        let dish10 = Dish(name: "Räksmörgås", ingredients: ["Räkor", "Bröd", "Majonnäs", "Dill", "Citron", "Ägg"], instruction: "Gör en schysst macka.", category: "Sea food")
        dishCollection?.addDish(dish: dish1)
        dishCollection?.addDish(dish: dish2)
        dishCollection?.addDish(dish: dish3)
        dishCollection?.addDish(dish: dish4)
        dishCollection?.addDish(dish: dish5)
        dishCollection?.addDish(dish: dish6)
        dishCollection?.addDish(dish: dish7)
        dishCollection?.addDish(dish: dish8)
        dishCollection?.addDish(dish: dish9)
        dishCollection?.addDish(dish: dish10)
        
    }


    @IBAction func addButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier:  segueIdGoToAdd, sender: self)
    }
    
    @IBAction func getRecipeButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier:  segueIdGoToRandom, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdGoToAdd {
            if let destinationVC = segue.destination as? AddRecipeViewController {
                destinationVC.dishCollection = dishCollection
            }
        } else {
            if let destinationVC = segue.destination as? ShowRandomRecipeViewController {
                destinationVC.dishCollection = dishCollection
            }
        }
    
    }
    
    @IBAction func unwindToStart(segue: UIStoryboardSegue) {}
}

