//
//  NetworkManager.swift
//  FetchMeals
//
//  Created by Saurabh Dave on 1/24/23.
//

import Foundation
import Combine

class NetworkManager: NetworkManagerProtocol {
    
    static let shared           = NetworkManager()
    private init() {}
    
    func getMeals(fromURL: NetworkURL) -> AnyPublisher<[Meal], Error> {
        guard let url = fromURL.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MealResponse.self, decoder: JSONDecoder())
            .compactMap { $0.meals }
            .eraseToAnyPublisher()
    }
    
    func getMealDetails(fromURL: NetworkURL) -> AnyPublisher<Meal, Error> {
        guard let url = fromURL.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MealResponse.self, decoder: JSONDecoder())
            .compactMap { $0.meals.first }
            .eraseToAnyPublisher()
    }
    
}
