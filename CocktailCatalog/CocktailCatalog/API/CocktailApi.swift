//
//  CocktailApi.swift
//  CocktailCatalog
//
//  Created by Кирилл Коновалов on 13.08.2020.
//  Copyright © 2020 Кирилл Коновалов. All rights reserved.
//

import Foundation

class CocktailApi {
    
    var cocktailResults: DrinksResults?
    var cocktailResult: CocktailResults?
    
    func getAllCocktail(completion: @escaping (Result<DrinksResults, NetworkError>) -> Void) {
        
        //Build up the URL with necessary information
        var request = URLRequest(url: Endpoints.getAll.url)
        request.httpMethod = HTTPMethod.get.rawValue
        
        //Request the data
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.otherError(error!)))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            //Decode the data
            let decoder = JSONDecoder()
            do {
                self.cocktailResults = try decoder.decode(DrinksResults.self, from: data)
                completion(.success(self.cocktailResults!))
            } catch  {
                completion(.failure(.decodeFail))
                return
            }
        }.resume()
    }
    
    func whichButtonWasPushed() {
            getAllCocktail { (result) in
                do {
                    let cocktail = try result.get()
                    DispatchQueue.main.async {
                        self.cocktailResults = cocktail
                        guard let res = self.cocktailResults else { return }
                        print(res)
                    }
                } catch {
                    print(result)
                }
            }
    }
}

extension CocktailApi {
    enum NetworkError: Error {
        case otherError(Error)
        case noData
        case decodeFail
    }
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case pull = "PULL"
        case delete = "DELETE"
    }
    
    enum Endpoints {
        case getAll
        case getRandomCocktail
        case getImage(String)
        
        var stringValue: String {
            switch self {
            case .getAll:
                return ServerAPI.baseURL + ServerAPI.all
            case .getRandomCocktail:
                return ServerAPI.baseURL + ServerAPI.random
            case .getImage(let imagePath):
                return imagePath
            }
        }
        var url: URL {
            return URL(string: stringValue)!
        }
    }
}
