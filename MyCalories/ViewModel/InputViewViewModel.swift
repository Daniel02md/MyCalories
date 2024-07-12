//
//  RegisterViewViewModel.swift
//  Mycalorie
//
//  Created by Guilherme Pessoa on 04/07/24.
//

import Foundation
import Combine

class InputViewViewModel: ObservableObject{
    @Published var Age: Int = 0
    @Published var Height: Double = 0
    @Published var Weight: Double = 0.0
    @Published var SelectedObjective: Objective = .maintain
    @Published var SelectedActivity: Activity = .sedentary
    @Published var SelectedGender: Gender = .male
    @Published var errorMessage = ""
    @Published var Calories: Double = 0.0
    @Published var CarboG: Double = 0.0
    @Published var ProteinG: Double = 0.0
    @Published var FatG: Double = 0.0
    
  
     func Validate() -> Bool{
        errorMessage = ""
         
         if !validateNumericInput("\(Age)") || !validateNumericInput("\(Height)") || !validateNumericInput("\(Weight)") {
             errorMessage = "fill all fields with natural numbers"
             return false

         }
        guard Height > 0.0 || Weight > 0.0 || Age > 0 else{
            errorMessage = "fill all fields with natural numbers"
            return false
        }
        return true
    }
    
    private func validateNumericInput(_ value: String) -> Bool {
        return Double(value) != nil
    }
    
    
    func calculateCalories(){
        guard Validate() else{
            return
        }
        if SelectedGender == .male{
            Calories = (88.362 + (13.397 * Weight) + (4.799 * Height) - (5.677 * Double(Age))) * SelectedActivity.rawValue * SelectedObjective.rawValue
            
         } else{
             Calories = (447.593 + (9.247 * Weight) + (3.098 * Height) - (4.330 * Double(Age))) * SelectedActivity.rawValue * SelectedObjective.rawValue
                         
         }
        
    }
     
     func calculateMacros(){
         guard Validate() else{
             return
         }
         FatG = (Calories * 0.25)/9
        CarboG = (Calories * 0.45)/4
        ProteinG = (Calories * 0.30)/4
         
       
    }
    
}


enum Gender: String,CaseIterable,Identifiable{
    case female,male
    var id: Self { self }

}

enum Activity: Double,CaseIterable,Identifiable{
    case sedentary = 1.2
    case active = 1.45
    case extremely_active = 1.7
    var id: Self { self }
    var descriptionA: String{
        switch self {
        case .sedentary:
            return "Sedentary"
        case .active:
            return "active"
        case .extremely_active:
            return "extremely_active"
        }
    }
}

    
enum Objective: Double,CaseIterable,Identifiable{
    case loss_weight = 0.9
    case maintain = 1.0
    case gain_weight = 1.1
    
    var id: Self { self }
    var descriptionO: String{
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



