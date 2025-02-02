
//
//  FoodView.swift
//  Mycalorie
//
//  Created by Guilherme Pessoa on 03/07/24.
//

import SwiftUI

struct LabelCView: View {
    @EnvironmentObject var viewModel: InputViewViewModel
     var nutritionResponse: NutritionResponse
    var body: some View {
        
            VStack{
                GroupBox(label: Text("calories")){
                    VStack(alignment: .leading, spacing: 8){
                        Text("Daily Calories: \(viewModel.Calories,specifier: "%.0f")")
//                         Text("consumed calories: \(nutritionResponse.calories,specifier: "%.0f")")
//                        Text("Remaining calories \(viewModel.Calories - nutritionResponse.calories,specifier: "%.0f")")
                    }
                    
                }
            .padding()
            }
    }
}
