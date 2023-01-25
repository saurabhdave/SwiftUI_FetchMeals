//
//  Meals.swift
//  FetchMeals
//
//  Created by Saurabh Dave on 1/24/23.
//

import Foundation

// MARK: - Meals
struct MealResponse: Codable {
    let meals: [Meal]
}

/**
 
 {
     "strMeal": "Apam balik",
     "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
     "idMeal": "53049"
   },
 */

// MARK: - Meal
struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strCategory: String?
    let strInstructions: String?
    let strMealThumb: String
    let strYoutube: String?
    let strIngredient1, strIngredient2, strIngredient3 , strIngredient4, strIngredient5: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5: String?
}
