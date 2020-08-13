//
//  ServerApi.swift
//  CocktailCatalog
//
//  Created by Кирилл Коновалов on 13.08.2020.
//  Copyright © 2020 Кирилл Коновалов. All rights reserved.
//

import Foundation

/// enum с перечеслинение API-endpoints
enum ServerAPI {
    
    static var baseURL = "https://www.thecocktaildb.com/api/json/v1/1"
    //Все коктейли
    static let all = "/search.php?f=a"
    //Поиск по имени
    static let searchName = "/search.php?s="
    //Поиск по ингридиенту
    static let searchIngredient = "/search.php?i="
    //Случайный коктейль
    static let random = "/random.php"
    
}
