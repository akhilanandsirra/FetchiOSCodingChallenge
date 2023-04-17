//
//  ViewModel.swift
//  FetchiOSCodingChallenge
//
//  Created by Akhil Anand Sirra on 16/04/23.
//

import Foundation

@MainActor
final class ViewModel: ObservableObject {
    @Published private(set) var mealsData = [Meal]()
    @Published private(set) var recipeData = [String: Recipe]()

    static let mealsURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    static let mealDetailsURL = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    
    @Published var searchText: String = ""
    
    var searchResults: [Meal] {
        if searchText.isEmpty {
            return mealsData // if search is empty return unfiltered data
        } else {
            return mealsData.filter { $0.strMeal.lowercased().contains(searchText.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)) }
        }
    }
    
    func fetchMealData() async {
        async let callMeals: Void = fetchMeals()
        let _ = await [callMeals]
    }
    
    private func fetchMeals() async {
        do {
            let meals: Meals = try await NetworkingManager.shared.request(Self.mealsURL)
            mealsData = meals.meals.map { $0 }
            mealsData.sort { $0.strMeal < $1.strMeal }
        } catch {
            dump(error)
        }
    }
    
    func fetchReceipeData(for mealID: String) async {
        async let callReceipes: Void = fetchReceipes(for: mealID)
        let _ = await [callReceipes]
    }
    
    private func fetchReceipes(for mealID: String) async {
        do {
            let receipes: Recipes = try await NetworkingManager.shared.request(Self.mealDetailsURL + mealID)
            recipeData[mealID] = receipes.meals.first
        } catch {
            dump(error)
        }
    }
    
    func fetchIngredients(for recipeData: Recipe) -> String {
        var result = ""
        let mirror = Mirror(reflecting: recipeData)
        for i in 1...20 {
            let ingredientKey = "strIngredient\(i)"
            let measureKey = "strMeasure\(i)"
            for child in mirror.children {
                if child.label == ingredientKey,
                   let ingredient = child.value as? String,
                   !ingredient.isEmpty,
                   let measureChild = mirror.children.first(where: { $0.label == measureKey }),
                   let measure = measureChild.value as? String,
                   !measure.isEmpty {
                    result += "\(ingredient.localizedCapitalized) - \(measure)\n"
                    break
                }
            }
        }
        return result.trimmingCharacters(in: .newlines)
    }
}
