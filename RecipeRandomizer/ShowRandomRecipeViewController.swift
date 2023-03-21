//
//  ShowRandomRecipeViewController.swift
//  RecipeRandomizer
//
//  Created by Tobias Sörensson on 2023-03-19.
//

import UIKit

class ShowRandomRecipeViewController: UIViewController {
    
    var dishCollection: DishCollection?
    var randomDish: Dish?

    
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    override func viewDidLoad() {
        ingredientsLabel.sizeToFit()
        instructionsLabel.sizeToFit()
       super.viewDidLoad()
        randomDish = dishCollection?.getRandomDish()
        showDish()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func randomButtonPressed(_ sender: Any) {
        randomDish = dishCollection?.getRandomDish()
        showDish()
    }
    
    func showDish() {
        if let randomDish {
            recipeNameLabel.text = randomDish.name
            categoryLabel.text = randomDish.category
            ingredientsLabel.text = randomDish.ingredients.joined(separator:", ")
            instructionsLabel.text = randomDish.instruction
            
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
