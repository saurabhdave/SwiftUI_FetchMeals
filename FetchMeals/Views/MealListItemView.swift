//
//  MealListItemView.swift
//  FetchMeals
//
//  Created by Saurabh Dave on 1/24/23.
//

import SwiftUI

struct MealListItemView: View {
    // MARK: - PROPERTIES
    let meal: Meal
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                AsyncImage(
                    url: URL(string: meal.strMealThumb),
                    transaction: Transaction(animation: .easeInOut)
                ) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .transition(.scale(scale: 0.1, anchor: .center))
                    case .failure:
                        Image(systemName: "wifi.slash")
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 100, height: 100)
                .background(Color.gray)
                .clipShape(Circle())
            }//: ZSTACK
            
            VStack(alignment: .leading, spacing: 10) {
                Text(meal.strMeal)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
            }//: VSTACK
            
        }//: HSTACK
    }
}

//struct MealListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealListItemView(meal: Meal())
//    }
//}
