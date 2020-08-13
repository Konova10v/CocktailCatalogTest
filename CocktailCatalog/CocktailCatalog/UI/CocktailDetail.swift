//
//  CocktailDetail.swift
//  CocktailCatalog
//
//  Created by Кирилл Коновалов on 13.08.2020.
//  Copyright © 2020 Кирилл Коновалов. All rights reserved.
//

import SwiftUI

struct CocktailDetail: View {
    var body: some View {
        ScrollView() {
            VStack(spacing: 10) {
                Image(systemName: "square.grid.2x2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                Text("Name")
                    .bold()
                    .font (.custom ("Roboto-Regular", size: 35))
                    .padding(.top, 20)
                Text("Ingredients")
                    .bold()
                    .font (.custom ("Roboto-Regular", size: 25))
            }
            List() {
                VStack() {
                    Text("Name")
                    Text("Колличество")
                }
            }
        }
    }
}

struct CocktailDetail_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDetail()
    }
}
