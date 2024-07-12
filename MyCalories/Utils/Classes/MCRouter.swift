//
//  MCRouter.swift
//  MyCalories
//
//  Created by Marcos Bezerra on 09/07/24.
//

import SwiftUI

final class AppRouter: NavigationRouter, ObservableObject{

    typealias Destination = MCRouterDestination
    
    @ViewBuilder func view(for route: Destination) -> some View {
        
    }
    
    @Published var navigationPath: NavigationPath = NavigationPath()
    
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
