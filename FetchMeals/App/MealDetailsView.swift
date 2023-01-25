//
//  MealDetailsView.swift
//  FetchMeals
//
//  Created by Saurabh Dave on 1/24/23.
//

import SwiftUI

struct MealDetailsView: View {
    
    @StateObject fileprivate var viewModel = MealDetailsViewModel()
    
    // MARK: - PROPERTIES
    let meal: Meal
    let imageSize: CGFloat = 300
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                if let imageURL = viewModel.mealDetails?.strMealThumb {
                    
                    // COVER IMAGE
                    AsyncImage(url: URL(string:imageURL)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame( height: imageSize)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }else {
                    Color.gray.frame(height: imageSize)
                    
                }
                
                // TITLE
                Text(viewModel.mealDetails?.strMeal.uppercased() ?? "")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                
                // HEADLINE
                Text(viewModel.mealDetails?.strInstructions ?? "")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // INGREDIENTS
                Group {
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.bold)
                        .underline(color: .accentColor)
                    
                    GroupBox {
                        IngredientItemView(ingredientName: viewModel.mealDetails?.strIngredient1 ?? "", ingredientMeasure: viewModel.mealDetails?.strMeasure1 ?? "")
                        IngredientItemView(ingredientName: viewModel.mealDetails?.strIngredient2 ?? "", ingredientMeasure: viewModel.mealDetails?.strMeasure2 ?? "")
                        IngredientItemView(ingredientName: viewModel.mealDetails?.strIngredient3 ?? "", ingredientMeasure: viewModel.mealDetails?.strMeasure3 ?? "")
                        IngredientItemView(ingredientName: viewModel.mealDetails?.strIngredient4 ?? "", ingredientMeasure: viewModel.mealDetails?.strMeasure4 ?? "")
                        IngredientItemView(ingredientName: viewModel.mealDetails?.strIngredient5 ?? "", ingredientMeasure: viewModel.mealDetails?.strMeasure5 ?? "")
                    }//: GROUPBOX
                    .padding(.horizontal)
                }//: GROUP
                
                YouTubeLinkView(linkName: viewModel.mealDetails?.strMeal ?? "", youTubeLink: viewModel.mealDetails?.strYoutube ?? "")
                    .padding(.horizontal)
                
                
            }//: VSTACK
            .onAppear { viewModel.getMealDetails(mealId: meal.idMeal) }
            if viewModel.isLoading { LoadingView() }
            
        }//: SCROLL
        .navigationTitle("How to Prepare \(meal.strMeal)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

//struct MealDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealDetailsView()
//    }
//}
