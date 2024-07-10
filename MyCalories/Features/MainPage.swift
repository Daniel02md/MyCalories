//
//  MainPage.swift
//  MyCalories
//
//  Created by Marcos Bezerra on 10/07/24.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        VStack{
            HStack(spacing: 20){
                DailyMeal("breakfast")
                DailyMeal("lunch")
                DailyMeal("dinner")
                DailyMeal("others")
            }
            .padding(.top, 30)
        }
        .toolbar{
            ToolbarItem(placement: .topBarTrailing){
                Button{
                    
                } label: {
                    Image(systemName: "gearshape")
                }
                .foregroundColor(.black)
            }
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    RouterView{
        MainPage()
    }
}
