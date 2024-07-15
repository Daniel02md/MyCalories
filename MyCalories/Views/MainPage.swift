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
    @State private var selectedMealNutrients: [Nutrient] = []
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            VStack {
                HStack(spacing: 20) {
                    ForEach(dailyMeals, id: \.self) { meal in
                        DailyMealButton(meal) {
                            FoodView(meal: meal, selectedMealNutrients: $selectedMealNutrients)
                        }
                    }
                }
                .padding(.top, 30)
                LabelCView()
                    .padding()
                if showGraficCircleView {
                    GraficCircleView(nutrients: selectedMealNutrients, errorMessage: nil, foodName: "Selected Meal")
                        .frame(height: 300)
                        .padding()
                }
            }
            .onChange(of: selectedMealNutrients) { newValue in
                showGraficCircleView = !newValue.isEmpty
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
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
    RouterView {
        MainPage()
    }
}
