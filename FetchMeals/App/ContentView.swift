//
//  ContentView.swift
//  FetchMeals
//
//  Created by Saurabh Dave on 1/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject fileprivate var viewModel = MealsListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(viewModel.meals, id: \.idMeal) { meal in
                        NavigationLink {
                            MealDetailsView(meal: meal)
                        } label: {
                            MealListItemView(meal: meal)
                                .padding(.vertical, 8)
                        }//: LINK
                    }//: LOOP
                }//: LIST
                .refreshable {
                    viewModel.getMeals(category: "Dessert")
                }
                .listStyle(.plain)
                .navigationTitle("Desserts")
            }
            .onAppear { viewModel.getMeals(category: "Dessert") }
            
            if viewModel.isLoading { LoadingView() }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
