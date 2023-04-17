//
//  Meals.swift
//  FetchiOSCodingChallenge
//
//  Created by Akhil Anand Sirra on 15/04/23.
//

import Foundation

struct Meals: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable {
    let strMeal: String
    let strMealThumb: URL
    let idMeal: String
}


extension Meal {
    enum CodingKeys: CodingKey {
        case strMeal, strMealThumb, idMeal
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.strMeal = try container.decode(String.self, forKey: .strMeal)
        let thumbnailString = try container.decode(String.self, forKey: .strMealThumb)
        self.strMealThumb = URL(string: thumbnailString)!
        self.idMeal = try container.decode(String.self, forKey: .idMeal)
    }
}

extension Meal {
    static let sampleData = [
        Meal(strMeal: "Apam balik", strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")!, idMeal: "53049"),
        Meal(strMeal: "Apple & Blackberry Crumble", strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")!, idMeal: "52893")
    ]
}


