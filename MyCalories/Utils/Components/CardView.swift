//
//  CardView.swift
//  MyCalories
//
//  Created by marcelodearaujo on 08/07/24.
//

import SwiftUI

struct CardView: View {
    var title: String
    @Binding var isSelected: Bool

    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(isSelected ? .black : .gray)
                    .frame(width: 8, height: 8)
                Spacer()
            }
            .padding()

            Spacer()

            Text(title)
                .font(.headline)
                .foregroundColor(.clear)
                .padding(.bottom, 20)

            Spacer()
        }
        .background(isSelected ? Color.blue.opacity(0.1) : Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .frame(width: 146, height: 85)
        .onTapGesture {
            isSelected.toggle()
        }
    }
}
