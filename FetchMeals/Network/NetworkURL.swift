//
//  NetworkURL.swift
//  FetchMeals
//
//  Created by Saurabh Dave on 1/24/23.
//

import Foundation

enum NetworkURL {
    
    private static let baseURL = "https://themealdb.com/api/json/v1/1"
    case getListOfMeals(category: String)
    case getMealDetails(mealID: String)
}

extension NetworkURL {

    var url: URL? {
        switch self {
        case .getListOfMeals(let category):
            var urlComponents = URLComponents(string: NetworkURL.baseURL)
            urlComponents?.path = URLPaths.filter.mealsQueryType
            urlComponents?.queryItems = [
                URLQueryItem(name: "c", value: category)
            ]
            guard let url = urlComponents?.url else { return nil }
            return url
            
        case .getMealDetails(let mealID):
            var urlComponents = URLComponents(string: NetworkURL.baseURL)
            urlComponents?.path = URLPaths.lookup.mealsQueryType
            urlComponents?.queryItems = [
                URLQueryItem(name: "i", value: mealID)
            ]
            guard let url = urlComponents?.url else { return nil }
            return url
        }
    }
}
