//
//  IngredientSearch.swift
//  CocktailCatalog
//
//  Created by Кирилл Коновалов on 13.08.2020.
//  Copyright © 2020 Кирилл Коновалов. All rights reserved.
//

import Foundation

struct IngredientSearch: Codable {
    let drinkName: String
    let drinkID: String
    
    enum CodingKeys: String, CodingKey {
        case drinkName = "strDrink"
        case drinkID = "idDrink"
    }
}

struct IngredientDrinks: Codable {
    let drinks: [IngredientSearch]
}
