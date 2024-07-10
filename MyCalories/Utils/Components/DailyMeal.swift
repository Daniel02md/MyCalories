//
//  DailyMeal.swift
//  MyCalories
//
//  Created by Marcos Bezerra on 10/07/24.
//

import SwiftUI

struct DailyMeal: View {
    private var name: String
    
    init(_ name: String) {
        self.name = name
    }
    var body: some View {
        VStack{
            VStack{
                Image("cutlery")
            }
            .frame(width: 60, height: 60)
            .background(.green)
            .cornerRadius(10)
    
            Text(name)
                .bold()
        }
        
    }
}

#Preview {
    DailyMeal("breakfast")
}
