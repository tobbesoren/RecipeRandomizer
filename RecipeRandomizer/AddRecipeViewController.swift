//
//  AddRecipeViewController.swift
//  RecipeRandomizer
//
//  Created by Tobias Sörensson on 2023-03-16.
//

import UIKit

class AddRecipeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var recipeNameEdit: UITextField!
    @IBOutlet weak var ingredientEdit: UITextField!
    @IBOutlet weak var ingredientListLabel: UILabel!
    @IBOutlet weak var instructionsEdit: UITextField!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    let categoryPickerList: [String] = ["Vegetarian",
                                        "Vegan",
                                        "Meat",
                                        "Poultry",
                                        "Sea food"
                                        ]

    var dishCollection: DishCollection?
    var ingredientList: [String] = []
    var selectedCategory: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dishCollection = DishCollection()
        
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
        
        categoryPickerView.selectRow(0, inComponent: 0, animated: false)
        pickerView(categoryPickerView, didSelectRow: 0, inComponent: 0)
    }
    

    @IBAction func addIngredientButtonPressed(_ sender: Any) {
        if let ingredient = ingredientEdit.text {
            
            ingredientList.append(ingredient)
            
            ingredientEdit.text = ""
            ingredientListLabel.text = ingredientList.joined(separator:", ")
            print(ingredientList)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryPickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryPickerList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = categoryPickerList[row]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addButtonPressed(_ sender: Any) {
        if let recipeName = recipeNameEdit.text,
           let instructions = instructionsEdit.text,
           let selectedCategory  {
            print(ingredientList)
            let newRecipe = Dish(
                name: recipeName,
                ingredients: ingredientList,
                instruction: instructions,
                category: selectedCategory)
            
            dishCollection?.addDish(dish: newRecipe)
            
            print(dishCollection ?? "No data")
        }
    }
}
