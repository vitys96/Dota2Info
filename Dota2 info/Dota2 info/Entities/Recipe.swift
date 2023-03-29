//
//  Recipe.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 29.03.2023.
//

import Foundation

public struct RecipesResponse: Codable {
    let recipes: [RecipeResponse]
}

struct RecipeResponse: Codable {
    let id: Int
    let title: String
    let image: String?
    let summary: String
    let readyInMinutes: Int
    let servings: Int
    let cuisines: [String]
    let dishTypes: [String]
    let analyzedInstructions: [AnalyzedInstructionsResponse]
    let extendedIngredients: [IngredientResponse]?
    let nutrition: NutritionResponse?
}

struct NutritionResponse: Codable {
    let nutrients: [NutrientResponse]
}

struct NutrientResponse: Codable {
    let name: String
    let amount: Double
    let unit: String
    let percentOfDailyNeeds: Double?
}

struct AnalyzedInstructionsResponse: Codable {
    let steps: [AnalyzedInstructionsStepResponse]
}

struct AnalyzedInstructionsStepResponse: Codable {
    let number: Int
    let step: String
    let ingredients: [IngredientResponse]
}

struct IngredientResponse: Codable {
    let id: Int
    let name: String
    let image: String?
    let measures: MeasuresResponse?
}

struct MeasuresResponse: Codable {
    let us: MeasureResponse
    let metric: MeasureResponse
}

struct MeasureResponse: Codable {
    let amount: Double
    let unitShort: String
}

struct Recipe: Equatable {
    let id: Int
    let title: String
    let imageUrl: URL?
    let summary: String
    let readyInMinutes: String
    let servings: String
    let cuisines: [String]
    let dishTypes: [String]
    let steps: [RecipeInstructionStep]
    var ingredients: [RecipeIngredient]
    var nutrients: [Nutrient]
    
    static var empty: Recipe {
        Recipe(
            id: 0,
            title: "",
            imageUrl: nil,
            summary: "",
            readyInMinutes: "",
            servings: "",
            cuisines: [],
            dishTypes: [],
            steps: [],
            ingredients: [],
            nutrients: []
        )
    }
}

struct RecipeInstructionStep: Equatable {
    let number: Int
    let text: String
    let ingredients: [RecipeIngredient]
}

struct RecipeIngredient: Identifiable, Equatable {
    let id: Int
    let name: String
    let imageUrl: URL?
    let measures: Measures?
}

struct Measures: Equatable {
    let us: Measure
    let metric: Measure
}

struct Measure: Equatable {
    let amount: Double
    let unitShort: String
}

struct Nutrient: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let amount: String
    let unit: String
    let percentOfDailyNeeds: Double?
}
