//
//  DishCollection.swift
//  RecipeRandomizer
//
//  Created by Tobias Sörensson on 2023-03-15.
//

import Foundation

class DishCollection: CustomStringConvertible{
    private var dishes: [Dish]
    
    init() {
        self.dishes = []
    }
    
    var description: String {
        return "\(dishes)"
    }
    
    func addDish(dish: Dish) {
        dishes.append(dish)
    }
    
    func getRandomDish() -> Dish {
        let randomIndex = Int.random(in: 0..<dishes.count)
        return dishes[randomIndex]
    }
    
    func getAllDishes() -> [Dish] {
        return dishes
    }
}
