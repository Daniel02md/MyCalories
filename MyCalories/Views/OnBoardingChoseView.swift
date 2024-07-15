//
//  OnBoardingChoseView.swift
//  MyCalories
//
//  Created by marcelodearaujo on 08/07/24.
//

import SwiftUI

struct OnBoardingChoseView: View {
    
    @StateObject var viewModel = InputViewViewModel()
    @EnvironmentObject private var router: AppRouter
    @State private var isActive: Bool = false
    
    var body: some View {
        
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
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationDestination(isPresented: $isActive){
            InputView()
                .environmentObject(viewModel)
                .navigationBarBackButtonHidden(true)
        }
        
    }
}

