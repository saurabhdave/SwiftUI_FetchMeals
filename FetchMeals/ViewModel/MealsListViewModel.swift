//
//  MealsViewModel.swift
//  FetchMeals
//
//  Created by Saurabh Dave on 1/24/23.
//

import Foundation
import Combine

final class MealsListViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    
    func getMeals(category: String) {
        isLoading = true
        
        NetworkManager.shared.getMeals(fromURL: NetworkURL.getListOfMeals(category: category))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] meals in
                print(meals)
                self?.meals = meals.sorted(by: { $0.strMeal < $1.strMeal })
            }).store(in: &self.cancellables)
        
    }
}
