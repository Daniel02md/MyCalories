//
//  Gender.swift
//  MyCalories
//
//  Created by Marcelo De Araújo on 14/07/24.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
    case female, male
    var id: Self { self }
}
