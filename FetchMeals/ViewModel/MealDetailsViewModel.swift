//
//  MealDetailsViewModel.swift
//  FetchMeals
//
//  Created by Saurabh Dave on 1/24/23.
//

import Foundation
import Combine

final class MealDetailsViewModel: ObservableObject {
    
    @Published var mealDetails: Meal?
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    
    func getMealDetails(mealId: String) {
        isLoading = true
        
        NetworkManager.shared.getMealDetails(fromURL: NetworkURL.getMealDetails(mealID: mealId))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] meal in
                print(meal)
                self?.mealDetails = meal
            }).store(in: &self.cancellables)
        
    }
}
