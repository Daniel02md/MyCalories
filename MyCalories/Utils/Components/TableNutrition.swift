//
//  TableNutrition.swift
//  MyCalories
//
//  Created by marcelodearaujo on 11/07/24.
//

import SwiftUI

struct TableNutrition: View {
    let nutritionResponse: NutritionResponse
    @Binding var searchText: String
    
    var body: some View {
        List {
            Section(header: Text("General Information")) {
                Text("Calories: \(nutritionResponse.calories, specifier: "%.2f") kcal")
                Text("Total Weight: \(nutritionResponse.totalWeight, specifier: "%.2f") g")
            }
            
            Section(header: Text("Total Nutrients")) {
                ForEach(nutritionResponse.totalNutrients.sorted(by: { $0.key < $1.key }), id: \.key) { key, nutrient in
                    HStack {
                        Text(nutrient.label)
                        Spacer()
                        Text("\(nutrient.quantity, specifier: "%.2f") \(nutrient.unit)")
                    }
                }
            }
        }
    }
}
