//
//  OnBoardingChoseView.swift
//  MyCalories
//
//  Created by marcelodearaujo on 08/07/24.
//

import SwiftUI

struct OnBoardingChoseView: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image("woman")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                    
                    VStack {
                        Text("Keep healthy...")
                            .font(.title)
                            .fontWeight(.black)
                            .shadow(radius: 10)
                        Text("What are your objectives?")
                            .font(.title)
                            .fontWeight(.black)
                            .shadow(radius: 10)
                    }
                }
                .statusBar(hidden: true)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isActive = true
                    }
                    //                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                    //                        isActive = true
                    //                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .background(
            NavigationLink(
                destination: NextView(),
                isActive: $isActive,
                label: {
                    EmptyView()
                }
            )
            .isDetailLink(false)
        )
    }
}

#Preview {
    OnBoardingChoseView()
}
