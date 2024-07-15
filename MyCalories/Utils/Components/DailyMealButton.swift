//
//  DailyMeal.swift
//  MyCalories
//
//  Created by Marcos Bezerra on 10/07/24.
//

import SwiftUI

struct DailyMealButton<Destination: View>: View {
    private var name: String
    private var destination: () -> Destination
    
    init(_ name: String, @ViewBuilder destination: @escaping () -> Destination) {
        self.name = name
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink(destination: destination()) {
            VStack {
                VStack {
                    Image("cutlery")
                }
                .frame(width: 60, height: 60)
                .background(Color.green)
                .cornerRadius(10)
                
                Text(name)
                    .bold()
                    .foregroundColor(.black)
            }
        }
    }
}

