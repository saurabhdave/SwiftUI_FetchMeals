//
//  IngredientItemView.swift
//  FetchMeals
//
//  Created by Saurabh Dave on 1/24/23.
//

import SwiftUI

struct IngredientItemView: View {
    
    // MARK: - PROPERTIES
    let ingredientName: String
    let ingredientMeasure: String
    
    // MARK: - BODY
    
    var body: some View {
        if ingredientName.isEmpty && ingredientMeasure.isEmpty {
            EmptyView()
        } else {
            VStack {
                HStack {
                    Text(ingredientName.uppercased())
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Text(ingredientMeasure)
                        .multilineTextAlignment(.trailing)
                }//: HSTACK
                .font(.title2)
                
                Divider()
                    .overlay(.secondary)
                
            }//: VSTACK
        }
    }
}

struct IngredientItemView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientItemView(ingredientName: "Plain flour", ingredientMeasure: "250 gms")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
