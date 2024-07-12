//
//  FoodView.swift
//  MyCalories
//
//  Created by marcelodearaujo on 10/07/24.
//

import SwiftUI

struct FoodView: View {
    var meal: String
    @State private var selectedNutritionType = "cooking"
    @State private var value = ""
    @State private var foodParam = ""
    @State private var selectedUnit = "g"
    @State private var nutritionResponse: NutritionResponse?
    @State private var errorMessage: String?
    @State private var selectedNumber = 0
    @State private var searchText = ""
    
    let serviceApi = ServiceApi()
    let units = ["g", "t", "tb", "oz", "kg", "cups", "ml"]
    let nutritionType = ["cooking", "logging"]
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .textInputAutocapitalization(.never)
                    .keyboardType(.default)
                
                Button(action: {
                    serviceApi.getNutritionAnalysisCompletion(nutritionType: selectedNutritionType, value: value, unit: selectedUnit, foodParam: searchText) { (code, response, error) in
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
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.trailing, 8)
            }
            Spacer()
            
            if let nutritionResponse = nutritionResponse {
                TableNutrition(nutritionResponse: nutritionResponse, searchText: $searchText)
                    .padding(.top)
            }
            
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
                            .background(Color.green)
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
        .navigationTitle(meal)
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

