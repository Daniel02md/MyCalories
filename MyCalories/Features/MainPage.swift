//
//  MainPage.swift
//  MyCalories
//
//  Created by Marcos Bezerra on 10/07/24.
//

import SwiftUI

struct MainPage: View {
    
    @EnvironmentObject private var router: AppRouter
    private var dailyMeals = [
        "breakfast",
        "lunch",
        "dinner",
        "others"
    ]
    
    @State private var showGraficCircleView = false
    @State private var selectedMealNutrients: [(name: String, quantity: Double)] = []
    
    
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
                
                if showGraficCircleView {
                    GraficCircleView(nutrients: selectedMealNutrients, errorMessage: nil, foodName: "Selected Meal")
                        .frame(height: 300)
                        .padding()
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        // goes to Information Realease Page
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
