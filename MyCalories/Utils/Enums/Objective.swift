//
//  Objective.swift
//  MyCalories
//
//  Created by Marcelo De Araújo on 14/07/24.
//

import Foundation

enum Objective: Double, CaseIterable, Identifiable {
    case loss_weight = 0.9
    case maintain = 1.0
    case gain_weight = 1.1
    var id: Self { self }
    var descriptionO: String {
        switch self {
        case .loss_weight:
            return "Loss Weight"
        case .maintain:
            return "Maintain"
        case .gain_weight:
            return "Gain Weight"
        }
    }
}
