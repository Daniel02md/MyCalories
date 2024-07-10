//
//  FoodView.swift
//  MyCalories
//
//  Created by marcelodearaujo on 10/07/24.
//

import SwiftUI

struct FoodView: View {
    @State private var selectedNutritionType = "cooking"
    @State private var value = ""
    @State private var foodParam = ""
    @State private var selectedUnit = "g"
    @State private var nutritionResponse: NutritionResponse?
    @State private var errorMessage: String?
    @State private var selectedNumber = 0
    
    let serviceApi = ServiceApi()
    let units = ["g", "t", "tb", "oz", "kg", "cups", "ml"]
    let nutritionType = ["cooking", "logging"]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Nutrition Type")
                        .hLeading()
                        .font(.title2)
                        .padding(.leading, 20)
                    Picker("Nutrition Type", selection: $selectedNutritionType) {
                        ForEach(nutritionType, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                HStack {
                    TextField("Value", text: $value)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .textInputAutocapitalization(.never)
                        .keyboardType(.decimalPad)
                    
                    Picker("Unit", selection: $selectedUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                TextField("Food Parameter", text: $foodParam)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .textInputAutocapitalization(.never)
                    .keyboardType(.default)
                
                NavigationLink(
                    destination: GraficCircleView(
                        nutrients: extractKeyNutrients(nutritionResponse),
                        errorMessage: errorMessage,
                        foodName: foodParam)) {

                    Text("Nutrition Analysis")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.top)
                .simultaneousGesture(TapGesture().onEnded {
                    serviceApi.getNutritionAnalysisCompletion(nutritionType: selectedNutritionType, value: value, unit: selectedUnit, foodParam: foodParam) { (code, response, error) in
                        if let response = response {
                            self.nutritionResponse = response
                            self.errorMessage = nil
                        } else if let error = error {
                            self.errorMessage = error.localizedDescription
                            self.nutritionResponse = nil
                        } else if let code = code {
                            self.errorMessage = code.message
                            self.nutritionResponse = nil
                        }
                    }
                })
            }
            .navigationTitle("Nutrition Analysis")
        }
    }
    
    func extractKeyNutrients(_ response: NutritionResponse?) -> [(name: String, quantity: Double)] {
        guard let response = response else { return [] }
        var nutrients: [(name: String, quantity: Double)] = []
        if let calories = response.totalNutrients["ENERC_KCAL"]?.quantity {
            nutrients.append((name: "Calories", quantity: calories))
        }
        if let fats = response.totalNutrients["FAT"]?.quantity {
            nutrients.append((name: "Total Fat", quantity: fats))
        }
        if let proteins = response.totalNutrients["PROCNT"]?.quantity {
            nutrients.append((name: "Protein", quantity: proteins))
        }
        return nutrients
    }
}
