//
//  FetchiOSCodingChallengeTests.swift
//  FetchiOSCodingChallengeTests
//
//  Created by Akhil Anand Sirra on 15/04/23.
//

import XCTest
@testable import FetchiOSCodingChallenge

final class FetchiOSCodingChallengeTests: XCTestCase {
    
    var viewModel: ViewModel!
    
    @MainActor
    override func setUp() {
        super.setUp()
        viewModel = ViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchMealData() {
        let expectation = XCTestExpectation(description: "Fetch meals")
        
        Task {
            await viewModel.fetchMealData()
            
            await MainActor.run {
                XCTAssertFalse(viewModel.mealsData.isEmpty)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchRecipeData() {
        let expectation = XCTestExpectation(description: "Fetch recipe")
        
        Task {
            let mealID = "52772"
            await viewModel.fetchReceipeData(for: mealID)
            
            await MainActor.run {
                XCTAssertNotNil(viewModel.recipeData[mealID])
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    @MainActor
    func testFetchIngredients() {
        let recipe = Recipe(idMeal: "52768", strMeal: "Apple Frangipan Tart", strDrinkAlternate: "", strCategory: "Dessert", strArea: "British", strInstructions: "Instructions", strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg")!, strTags: "Tart,Baking,Fruity", strYoutube: "https://www.youtube.com/watch?v=rp8Slv4INLk", strIngredient1: "digestive biscuits", strIngredient2: "butter", strIngredient3: "Bramley apples", strIngredient4: "butter, softened", strIngredient5: "caster sugar", strIngredient6: "free-range eggs, beaten", strIngredient7: "ground almonds", strIngredient8: "almond extract", strIngredient9: "flaked almonds", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "", strMeasure1: "175g/6oz", strMeasure2: "75g/3oz", strMeasure3: "200g/7oz", strMeasure4: "75g/3oz", strMeasure5: "75g/3oz", strMeasure6: "2", strMeasure7: "75g/3oz", strMeasure8: "1 tsp", strMeasure9: "50g/1¾oz", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "", strMeasure16: "", strMeasure17: "", strMeasure18: "", strMeasure19: "", strMeasure20: "", strSource: "", strImageSource: "", strCreativeCommonsConfirmed: "", dateModified: "")
        let expectedOutput = "Digestive Biscuits - 175g/6oz\nButter - 75g/3oz\nBramley Apples - 200g/7oz\nButter, Softened - 75g/3oz\nCaster Sugar - 75g/3oz\nFree-Range Eggs, Beaten - 2\nGround Almonds - 75g/3oz\nAlmond Extract - 1 tsp\nFlaked Almonds - 50g/1¾oz"
        let actualOutput = viewModel.fetchIngredients(for: recipe)
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
}
