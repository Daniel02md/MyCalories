//
//  RegisterViewViewModel.swift
//  Mycalorie
//
//  Created by Guilherme Pessoa on 04/07/24.
//

import Foundation
import Combine


class InputViewViewModel: ObservableObject{
    @MainActor @Published var Age: Int = 0
    @MainActor @Published var Height: Double = 0
    @MainActor @Published var Weight: Double = 0.0
    @MainActor @Published var SelectedObjective: Objective = .maintain
    @MainActor @Published var SelectedActivity: Activity = .sedentary
    @MainActor @Published var SelectedGender: Gender = .male
    //@MainActor var errorMessage = ""
    @MainActor @Published var Calories: Double = 0.0
    @MainActor @Published var CarboG: Double = 0.0
    @MainActor @Published var ProteinG: Double = 0.0
    @MainActor @Published var FatG: Double = 0.0
    
    
    
    /*
    func start(){
        guard Validate() else{
            return
        }
        // try login
    }
    
    private func Validate() -> Bool{
        errorMessage = ""
        guard !Height.isEmpty,!Weight.isEmpty, Age.isEmpty else{
            
            errorMessage = "fill all fields"
            return false
        }
        return true
    }
    */
    
    @MainActor func calculateCalories(){
        if SelectedGender == .male{
            Calories = (88.362 + (13.397 * Weight) + (4.799 * Height) - (5.677 * Double(Age))) * SelectedActivity.rawValue * SelectedObjective.rawValue
            
         } else{
             Calories = (447.593 + (9.247 * Weight) + (3.098 * Height) - (4.330 * Double(Age))) * SelectedActivity.rawValue * SelectedObjective.rawValue
                         
         }
        
    }

     
    @MainActor func calculateMacros(){
        FatG = (Calories * 0.25)/9
        CarboG = (Calories * 0.45)/4
        ProteinG = (Calories * 0.30)/4
    }
}
/*
 calcular calorias
 
 25% de gordura
 30% proteina
 45% carboidrato
 
 ex: 2400 calorias
 
 Grams_Fat = (2400 * 0.25)/9
 Grams_Protein = (2400 * 0.30)/4
 Grams_Carbs = (2400 * 0.45)/4
 if age = 0 {
 text("age")
 }
 
 */


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



