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
    var body: some View {
        NavigationStack {
            VStack{
                HStack(spacing: 20){
                    ForEach(dailyMeals, id: \.self){ meal in
                        DailyMealButton(meal, destination: FoodView(meal: meal))
                        
                    }
                }
                .padding(.top, 30)
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
