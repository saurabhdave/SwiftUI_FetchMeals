//
//  NetworkManagerProtocol.swift
//  FetchMeals
//
//  Created by Saurabh Dave on 1/24/23.
//

import Foundation
import Combine

protocol NetworkManagerProtocol {
    func getMeals(fromURL: NetworkURL) -> AnyPublisher<[Meal], Error>
    func getMealDetails(fromURL: NetworkURL) -> AnyPublisher<Meal, Error>
}
