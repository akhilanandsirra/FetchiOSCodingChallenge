//
//  Recipe.swift
//  FetchiOSCodingChallenge
//
//  Created by Akhil Anand Sirra on 15/04/23.
//

import Foundation

struct Recipes: Decodable {
    let meals: [Recipe]
}

struct Recipe: Decodable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: URL
    let strTags: String?
    let strYoutube: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
}

extension Recipe {
    enum CodingKeys: CodingKey {
        case idMeal, strMeal, strDrinkAlternate, strCategory, strArea, strInstructions, strMealThumb, strTags, strYoutube, strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20, strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20, strSource, strImageSource, strCreativeCommonsConfirmed, dateModified
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strDrinkAlternate = try container.decodeIfPresent(String.self, forKey: .strDrinkAlternate) ?? ""
        strCategory = try container.decodeIfPresent(String.self, forKey: .strCategory) ?? ""
        strArea = try container.decodeIfPresent(String.self, forKey: .strArea) ?? ""
        strInstructions = try container.decodeIfPresent(String.self, forKey: .strInstructions) ?? ""
        let thumbnailString = try container.decode(String.self, forKey: .strMealThumb)
        self.strMealThumb = URL(string: thumbnailString)!
        strTags = try container.decodeIfPresent(String.self, forKey: .strTags) ?? ""
        strYoutube = try container.decode(String.self, forKey: .strYoutube)
        strIngredient1 = try container.decodeIfPresent(String.self, forKey: .strIngredient1) ?? ""
        strIngredient2 = try container.decodeIfPresent(String.self, forKey: .strIngredient2) ?? ""
        strIngredient3 = try container.decodeIfPresent(String.self, forKey: .strIngredient3) ?? ""
        strIngredient4 = try container.decodeIfPresent(String.self, forKey: .strIngredient4) ?? ""
        strIngredient5 = try container.decodeIfPresent(String.self, forKey: .strIngredient5) ?? ""
        strIngredient6 = try container.decodeIfPresent(String.self, forKey: .strIngredient6) ?? ""
        strIngredient7 = try container.decodeIfPresent(String.self, forKey: .strIngredient7) ?? ""
        strIngredient8 = try container.decodeIfPresent(String.self, forKey: .strIngredient8) ?? ""
        strIngredient9 = try container.decodeIfPresent(String.self, forKey: .strIngredient9) ?? ""
        strIngredient10 = try container.decodeIfPresent(String.self, forKey: .strIngredient10) ?? ""
        strIngredient11 = try container.decodeIfPresent(String.self, forKey: .strIngredient11) ?? ""
        strIngredient12 = try container.decodeIfPresent(String.self, forKey: .strIngredient12) ?? ""
        strIngredient13 = try container.decodeIfPresent(String.self, forKey: .strIngredient13) ?? ""
        strIngredient14 = try container.decodeIfPresent(String.self, forKey: .strIngredient14) ?? ""
        strIngredient15 = try container.decodeIfPresent(String.self, forKey: .strIngredient15) ?? ""
        strIngredient16 = try container.decodeIfPresent(String.self, forKey: .strIngredient16) ?? ""
        strIngredient17 = try container.decodeIfPresent(String.self, forKey: .strIngredient17) ?? ""
        strIngredient18 = try container.decodeIfPresent(String.self, forKey: .strIngredient18) ?? ""
        strIngredient19 = try container.decodeIfPresent(String.self, forKey: .strIngredient19) ?? ""
        strIngredient20 = try container.decodeIfPresent(String.self, forKey: .strIngredient20) ?? ""
        strMeasure1 = try container.decodeIfPresent(String.self, forKey: .strMeasure1) ?? ""
        strMeasure2 = try container.decodeIfPresent(String.self, forKey: .strMeasure2) ?? ""
        strMeasure3 = try container.decodeIfPresent(String.self, forKey: .strMeasure3) ?? ""
        strMeasure4 = try container.decodeIfPresent(String.self, forKey: .strMeasure4) ?? ""
        strMeasure5 = try container.decodeIfPresent(String.self, forKey: .strMeasure5) ?? ""
        strMeasure6 = try container.decodeIfPresent(String.self, forKey: .strMeasure6) ?? ""
        strMeasure7 = try container.decodeIfPresent(String.self, forKey: .strMeasure7) ?? ""
        strMeasure8 = try container.decodeIfPresent(String.self, forKey: .strMeasure8) ?? ""
        strMeasure9 = try container.decodeIfPresent(String.self, forKey: .strMeasure9) ?? ""
        strMeasure10 = try container.decodeIfPresent(String.self, forKey: .strMeasure10) ?? ""
        strMeasure11 = try container.decodeIfPresent(String.self, forKey: .strMeasure11) ?? ""
        strMeasure12 = try container.decodeIfPresent(String.self, forKey: .strMeasure12) ?? ""
        strMeasure13 = try container.decodeIfPresent(String.self, forKey: .strMeasure13) ?? ""
        strMeasure14 = try container.decodeIfPresent(String.self, forKey: .strMeasure14) ?? ""
        strMeasure15 = try container.decodeIfPresent(String.self, forKey: .strMeasure15) ?? ""
        strMeasure16 = try container.decodeIfPresent(String.self, forKey: .strMeasure16) ?? ""
        strMeasure17 = try container.decodeIfPresent(String.self, forKey: .strMeasure17) ?? ""
        strMeasure18 = try container.decodeIfPresent(String.self, forKey: .strMeasure18) ?? ""
        strMeasure19 = try container.decodeIfPresent(String.self, forKey: .strMeasure19) ?? ""
        strMeasure20 = try container.decodeIfPresent(String.self, forKey: .strMeasure20) ?? ""
        strSource = try container.decodeIfPresent(String.self, forKey: .strSource) ?? ""
        strImageSource = try container.decodeIfPresent(String.self, forKey: .strImageSource) ?? ""
        strCreativeCommonsConfirmed = try container.decodeIfPresent(String.self, forKey: .strCreativeCommonsConfirmed) ?? ""
        dateModified = try container.decodeIfPresent(String.self, forKey: .dateModified) ?? ""
    }
}
