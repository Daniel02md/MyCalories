//
//  RegisterViewViewModel.swift
//  Mycalorie
//
//  Created by Guilherme Pessoa on 04/07/24.
//

import Foundation
import Combine

class InputViewViewModel: ObservableObject {
    @Published var ageString: String = ""
    @Published var heightString: String = ""
    @Published var weightString: String = ""
    @Published var SelectedObjective: Objective = .maintain
    @Published var SelectedActivity: Activity = .sedentary
    @Published var SelectedGender: Gender = .male
    @Published var errorMessage = ""
    @Published var Calories: Double = 0.0
    @Published var CarboG: Double = 0.0
    @Published var ProteinG: Double = 0.0
    @Published var FatG: Double = 0.0

    var isFormValid: Bool {
        !ageString.isEmpty && !heightString.isEmpty && !weightString.isEmpty
    }

    func Validate() -> Bool {
        errorMessage = ""

        guard let age = Int(ageString),
              let height = Double(heightString),
              let weight = Double(weightString),
              age > 0, height > 0, weight > 0 else {
            errorMessage = "Fill all fields with natural numbers"
            return false
        }

        return true
    }

    func calculateCalories() {
        guard Validate() else { return }

        let age = Int(ageString)!
        let height = Double(heightString)!
        let weight = Double(weightString)!

        if SelectedGender == .male {
            Calories = (88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * Double(age))) * SelectedActivity.rawValue * SelectedObjective.rawValue
        } else {
            Calories = (447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * Double(age))) * SelectedActivity.rawValue * SelectedObjective.rawValue
        }
    }

    func calculateMacros() {
        guard Validate() else { return }

        FatG = (Calories * 0.25) / 9
        CarboG = (Calories * 0.45) / 4
        ProteinG = (Calories * 0.30) / 4
    }
}
