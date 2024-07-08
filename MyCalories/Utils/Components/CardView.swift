//
//  CardView.swift
//  MyCalories
//
//  Created by marcelodearaujo on 08/07/24.
//

import SwiftUI

struct CardView: View {
    var title: String
    var imageName: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .cornerRadius(10)
                .clipped()

            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
                .padding([.top, .bottom], 10)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .frame(width: 180, height: 250)
    }
}
