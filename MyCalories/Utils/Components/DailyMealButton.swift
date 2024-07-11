//
//  DailyMeal.swift
//  MyCalories
//
//  Created by Marcos Bezerra on 10/07/24.
//

import SwiftUI

struct DailyMealButton: View {
    private var name: String
    private var action: () -> Void
    
    init(_ name: String, action: @escaping () -> Void) {
        self.name = name
        self.action = action
    }
    var body: some View {
        Button(action: action){
            VStack{
                VStack{
                    Image("cutlery")
                }
                .frame(width: 60, height: 60)
                .background(.green)
                .cornerRadius(10)
                
                Text(name)
                    .bold()
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    DailyMealButton("breakfast"){}
}
