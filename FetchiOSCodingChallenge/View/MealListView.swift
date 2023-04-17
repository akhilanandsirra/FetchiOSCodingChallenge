//
//  MealListView.swift
//  FetchiOSCodingChallenge
//
//  Created by Akhil Anand Sirra on 16/04/23.
//

import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        List(0..<viewModel.searchResults.count, id: \.self) { i in
            NavigationLink(destination: ReceipeDetailView(mealID: viewModel.searchResults[i].idMeal)) {
                MealListItem(meal: viewModel.searchResults[i])
            }
            .listRowSeparator(.hidden)
            .listRowBackground(
                RoundedRectangle(cornerRadius: 10)
                    .background(.clear)
                    .foregroundColor(Color(.systemBackground))
                
                    .padding(
                        EdgeInsets(
                            top: 5,
                            leading: 10,
                            bottom: 5,
                            trailing: 10
                        )
                    )
            )
        }
        .searchable(text: $viewModel.searchText)
        .listStyle(.plain)
        .task {
            await viewModel.fetchMealData()
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
