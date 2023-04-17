//
//  MealListItem.swift
//  FetchiOSCodingChallenge
//
//  Created by Akhil Anand Sirra on 16/04/23.
//

import SwiftUI

struct MealListItem: View {
    let meal: Meal
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                AsyncImage(url: meal.strMealThumb) { phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "photo")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .frame(height: 70)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .cornerRadius(4)
                    case .failure:
                        Image(systemName: "photo")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .frame(height: 70)
                    default:
                        Image(systemName: "questionmark")
                            .font(.headline)
                            .frame(height: 70)
                    }
                }
                Text(meal.strMeal)
                    .font(.headline)
            }
        }
        .padding()
    }
}

struct MealListItem_Previews: PreviewProvider {
    static var previews: some View {
        MealListItem(meal: Meal.sampleData[0])
    }
}
