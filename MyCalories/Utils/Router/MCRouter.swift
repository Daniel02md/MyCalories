//
//  MCRouter.swift
//  MyCalories
//
//  Created by Marcos Bezerra on 09/07/24.
//

import SwiftUI

final class AppRouter: ObservableObject {
    
    typealias Destination = MCRouterDestination
    
    @Published var navigationPath: NavigationPath = NavigationPath()
    
    @ViewBuilder func view(for route: Destination) -> some View {
        switch(route) {
        case .InputView:
            InputView()
                .navigationBarHidden(true)
        case .OnBoardingChose:
            OnBoardingChoseView()
        case .MainPage:
            MainPage()
                .navigationBarBackButtonHidden(true)
        case .FoodView(let title, let selectedMealNutrients):
            FoodView(meal: title, selectedMealNutrients: selectedMealNutrients)
                .navigationTitle(title)
        }
    }
    
    func navigate(to destination: Destination) {
        self.navigationPath.append(destination)
    }
    
    func navigateBackward() {
        navigationPath.removeLast()
    }
    
    func navigateBackward(step index: Int) {
        navigationPath.removeLast(index)
    }
    
    func navigateToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}
