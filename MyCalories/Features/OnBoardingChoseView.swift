//
//  OnBoardingChoseView.swift
//  MyCalories
//
//  Created by marcelodearaujo on 08/07/24.
//

import SwiftUI

struct OnBoardingChoseView: View {
    var body: some View {
        ZStack {
            VStack {
                Image("image_chose")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 295, height: 354)
                
                Text("Keep healthy...")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("What are your objectives?")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                VStack {
                    Text("Chose...")
                        .font(.callout)
                        .fontWeight(.regular)
                }
                .hLeading()
                .padding(.leading, 10)
            }
            Spacer()
            
        }
    }
}


#Preview {
    OnBoardingChoseView()
}
