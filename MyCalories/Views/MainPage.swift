//
//  MainPage.swift
//  MyCalories
//
//  Created by Marcos Bezerra on 10/07/24.
//

import SwiftUI

struct MainPage: View {
    @StateObject var viewModel = InputViewViewModel()
    @EnvironmentObject private var router: AppRouter
    private var dailyMeals = [
        "breakfast",
        "lunch",
        "dinner",
        "others"
    ]
    
    @State private var showGraficCircleView = false
    @State private var selectedMealNutrients: [(name: String, quantity: Double)] = []
    @State private var nutritionResponse = NutritionResponse(
            uri: "",
            calories: 220.0,
            totalCO2Emissions: 0.0,
            co2EmissionsClass: "",
            totalWeight: 0.0,
            dietLabels: [],
            healthLabels: [],
            cautions: [],
            totalNutrients: [:],
            totalDaily: [:],
            ingredients: [],
            totalNutrientsKCal: TotalNutrientsKCal(
                enercKcal: TotalNutrient(label: "", quantity: 0.0, unit: ""),
                procntKcal: TotalNutrient(label: "", quantity: 0.0, unit: ""),
                fatKcal: TotalNutrient(label: "", quantity: 0.0, unit: ""),
                chocdfKcal: TotalNutrient(label: "", quantity: 0.0, unit: "")
            )
        )
    
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack(spacing: 20){
                    ForEach(dailyMeals, id: \.self){ meal in
                        DailyMealButton(meal, destination: FoodView(meal: meal)) 
//                        {
//                            showGraficCircleView = true
//                        }
                    }
                }
                .padding(.top, 30)
                LabelCView(nutritionResponse: nutritionResponse)
                    .padding()
                if showGraficCircleView {
                    GraficCircleView(nutrients: selectedMealNutrients, errorMessage: nil, foodName: "Selected Meal")
                        .frame(height: 300)
                        .padding()
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink {
                        InputView()
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    .foregroundColor(.black)
                }
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    RouterView{
        MainPage()
    }
}
