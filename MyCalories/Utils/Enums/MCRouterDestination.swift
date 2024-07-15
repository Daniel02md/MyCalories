//
//  MCRouterDestination.swift
//  MyCalories
//
//  Created by Marcos Bezerra on 09/07/24.
//

import SwiftUI

enum MCRouterDestination: Hashable {
    case InputView
    case OnBoardingChose
    case MainPage
    case FoodView(title: String, selectedMealNutrients: Binding<[Nutrient]>)

    func hash(into hasher: inout Hasher) {
        switch self {
        case .InputView:
            hasher.combine("InputView")
        case .OnBoardingChose:
            hasher.combine("OnBoardingChose")
        case .MainPage:
            hasher.combine("MainPage")
        case .FoodView(let title, _):
            hasher.combine("FoodView")
            hasher.combine(title)
        }
    }
    
    static func == (lhs: MCRouterDestination, rhs: MCRouterDestination) -> Bool {
        switch (lhs, rhs) {
        case (.InputView, .InputView):
            return true
        case (.OnBoardingChose, .OnBoardingChose):
            return true
        case (.MainPage, .MainPage):
            return true
        case (.FoodView(let lhsTitle, _), .FoodView(let rhsTitle, _)):
            return lhsTitle == rhsTitle
        default:
            return false
        }
    }
}

