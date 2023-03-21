//
//  File.swift
//  RecipeRandomizer
//
//  Created by Tobias Sörensson on 2023-03-14.
//

import Foundation

class Dish: CustomStringConvertible {
    let name : String
    let ingredients : [String]
    let instruction : String
    let category : String
    
    init (name: String, ingredients: [String], instruction: String, category: String) {
        self.name = name
        self.ingredients = ingredients
        self.instruction = instruction
        self.category = category
    }
    
    var description: String {
        return "{name: \(name); ingredients: \(ingredients); instructions: \(instruction); category:  \(category)}"
    }
}
