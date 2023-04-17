//
//  ReceipeDetailView.swift
//  FetchiOSCodingChallenge
//
//  Created by Akhil Anand Sirra on 16/04/23.
//

import SwiftUI

struct ReceipeDetailView: View {
    @StateObject private var viewModel = ViewModel()
    let mealID: String
    
    var body: some View {
        ScrollView {
            VStack {
                Text(viewModel.recipeData[mealID]?.strMeal ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                AsyncImage(url: viewModel.recipeData[mealID]?.strMealThumb) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(4)
                            .padding()
                    case .failure:
                        Image(systemName: "photo")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .frame(height: 200)
                    default:
                        Image(systemName: "questionmark")
                            .font(.headline)
                            .frame(height: 200)
                    }
                }
                Text("Country of Origin: \(viewModel.recipeData[mealID]?.strArea ?? "Unknown")").padding()
                VStack(alignment: .leading, spacing: 8) {
                    Text("Ingredients & Measurements:")
                        .font(.headline)
                    if let recipe = viewModel.recipeData[mealID] {
                        Text(viewModel.fetchIngredients(for: recipe))
                    } else {
                        Text("Recipe not found")
                    }
                    Spacer()
                    Text("Recipe:")
                        .font(.headline)
                    Text(viewModel.recipeData[mealID]?.strInstructions ?? "No Instructions Available")
                }
                .frame(maxWidth: .infinity)
                .padding(25)
                
                if let youtubeURLString = viewModel.recipeData[mealID]?.strYoutube {
                    Link(destination: URL(string: youtubeURLString)!, label: {
                        Label("Watch Video", systemImage: "play.rectangle.fill")
                            .font(.system(size: 18).bold())
                            .padding(15)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(10)
                    })
                    .padding()
                }
            }
        }
        .task {
            if viewModel.recipeData[mealID] == nil {
                await viewModel.fetchReceipeData(for: mealID)
            }
        }
    }
}

struct ReceipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReceipeDetailView(mealID: Meal.sampleData[0].idMeal)
    }
}
