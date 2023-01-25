//
//  URLPaths.swift
//  FetchMeals
//
//  Created by Saurabh Dave on 1/24/23.
//

import Foundation

/**
 
 There are 2 endpoints that your app should utilize:
 ● https://themealdb.com/api/json/v1/1/filter.php?c=Dessert for fetching the list of meals in the
 Dessert category.
 ● https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID for fetching the meal details by its
 ID.
 
 */
enum URLPaths {
    case filter
    case lookup
}

extension URLPaths {
    var mealsQueryType: String {
        switch self {
        case .filter:
            return "/api/json/v1/1/filter.php"
        case .lookup:
            return "/api/json/v1/1/lookup.php"
        }
    }
}
