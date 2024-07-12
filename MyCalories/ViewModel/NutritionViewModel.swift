//
//  NutritionViewModel.swift
//  MyCalories
//
//  Created by marcelodearaujo on 10/07/24.
//

import Foundation
import Combine

class NutritionViewModel: ObservableObject {
    @Published var nutrients: [(name: String, quantity: Double)] = []
    private var cancellables = Set<AnyCancellable>()
    private let serviceApi = ServiceApi()
    
    func fetchNutritionData(nutritionType: String, value: String, unit: String, foodParam: String) {
        serviceApi.getNutritionAnalysisCombine(nutritionType: nutritionType, value: value, unit: unit, foodParam: foodParam) { [weak self] responseCode, response, error in
            guard let response = response else {
                print("Error fetching nutrition data: \(String(describing: error))")
                return
            }
            self?.nutrients = response.totalNutrients.map { (key, value) in
                (name: value.label, quantity: value.quantity)
            }
        }
    }
}
