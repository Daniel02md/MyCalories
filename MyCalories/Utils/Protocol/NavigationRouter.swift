//
//  NavigationRouter.swift
//  MyCalories
//
//  Created by Marcos Bezerra on 09/07/24.
//
import SwiftUI

protocol NavigationRouter: AnyObject, ObservableObject{
    associatedtype Destination: Hashable
    associatedtype ViewType: View
    
    func view(for route: Destination) -> ViewType
    
    var navigationPath: NavigationPath{
        get
    }
    
    func navigate(to destination: Destination)
    func navigateBackward()
    func navigateBackward(step index: Int)
    func navigateToRoot()
}
