//
//  Number.swift
//  Mycalorie
//
//  Created by Guilherme Pessoa on 11/07/24.
//

import Foundation

extension NumberFormatter {
    static var onlyNumbers: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.maximumFractionDigits = 0
        return formatter
    }
    static var decimalFormatter: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

