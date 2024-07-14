//
//  Activity.swift
//  MyCalories
//
//  Created by Marcelo De Araújo on 14/07/24.
//

import Foundation

enum Activity: Double, CaseIterable, Identifiable {
    case sedentary = 1.2
    case active = 1.45
    case extremely_active = 1.7
    var id: Self { self }
    var descriptionA: String {
        switch self {
        case .sedentary:
            return "Sedentary"
        case .active:
            return "Active"
        case .extremely_active:
            return "Extremely Active"
        }
    }
}
