//
//  GraficCircleView.swift
//  MyCalories
//
//  Created by marcelodearaujo on 10/07/24.
//

//import SwiftUI
//import Charts
//
//struct GraficCircleView: View {
//    let nutrients: [(name: String, quantity: Double)]
//    
//    @State var selectedQuantity: Double? = nil
//    
//    var cumulativeNutrientRanges: [(name: String, range: Range<Double>)] {
//        var cumulative = 0.0
//        return nutrients.map {
//            let newCumulative = cumulative + $0.quantity
//            let result = (name: $0.name, range: cumulative ..< newCumulative)
//            cumulative = newCumulative
//            return result
//        }
//    }
//    
//    var selectedNutrient: (name: String, quantity: Double)? {
//        if let selectedQuantity,
//           let selectedIndex = cumulativeNutrientRanges
//            .firstIndex(where: { $0.range.contains(selectedQuantity) }) {
//            return nutrients[selectedIndex]
//        }
//        return nil
//    }
//
//    var body: some View {
//        Chart(nutrients, id: \.name) { element in
//            SectorMark(
//                angle: .value("Quantity", element.quantity),
//                innerRadius: .ratio(0.618),
//                angularInset: 1.5
//            )
//            .cornerRadius(5.0)
//            .foregroundStyle(by: .value("Name", element.name))
//            .opacity(element.name == (selectedNutrient?.name ?? nutrients.first?.name) ? 1 : 0.3)
//        }
//        .chartLegend(alignment: .center, spacing: 18)
//        .chartAngleSelection(value: $selectedQuantity)
//        .scaledToFit()
//        #if os(macOS)
//        .transaction {
//            $0.animation = nil // Do not animate on MacOS.
//        }
//        #endif
//
//        .chartBackground { chartProxy in
//            GeometryReader { geometry in
//                let frame = geometry[chartProxy.plotFrame!]
//                VStack {
//                    Text("Selected Nutrient")
//                        .font(.callout)
//                        .foregroundStyle(.secondary)
//                        .opacity(selectedNutrient == nil ? 1 : 0)
//                    Text(selectedNutrient?.name ?? nutrients.first?.name ?? "")
//                        .font(.title2.bold())
//                        .foregroundColor(.primary)
//                    Text((selectedNutrient?.quantity.formatted() ?? nutrients.first?.quantity.formatted() ?? "") + " quantity")
//                        .font(.callout)
//                        .foregroundStyle(.secondary)
//                }
//                .position(x: frame.midX, y: frame.midY)
//            }
//        }
//    }
//}

import SwiftUI
import Charts

struct GraficCircleView: View {
    let nutrients: [(name: String, quantity: Double)]
    let errorMessage: String?
    let foodName: String
    
    @State var selectedQuantity: Double? = nil
    
    var cumulativeNutrientRanges: [(name: String, range: Range<Double>)] {
        var cumulative = 0.0
        return nutrients.map {
            let newCumulative = cumulative + $0.quantity
            let result = (name: $0.name, range: cumulative ..< newCumulative)
            cumulative = newCumulative
            return result
        }
    }
    
    var selectedNutrient: (name: String, quantity: Double)? {
        if let selectedQuantity,
           let selectedIndex = cumulativeNutrientRanges
            .firstIndex(where: { $0.range.contains(selectedQuantity) }) {
            return nutrients[selectedIndex]
        }
        return nil
    }

    var body: some View {
        VStack {
            if nutrients.isEmpty {
                Text(errorMessage ?? "No data available")
            } else {
                Chart(nutrients, id: \.name) { element in
                    SectorMark(
                        angle: .value("Quantity", element.quantity),
                        innerRadius: .ratio(0.618),
                        angularInset: 1.5
                    )
                    .cornerRadius(5.0)
                    .foregroundStyle(by: .value("Name", element.name))
                    .opacity(element.name == (selectedNutrient?.name ?? nutrients.first?.name) ? 1 : 0.3)
                }
                .chartLegend(alignment: .center, spacing: 18)
                .chartAngleSelection(value: $selectedQuantity)
                .scaledToFit()
                #if os(macOS)
                .transaction {
                    $0.animation = nil // Do not animate on MacOS.
                }
                #endif

                .chartBackground { chartProxy in
                    GeometryReader { geometry in
                        let frame = geometry[chartProxy.plotFrame!]
                        VStack {
                            Text("\(foodName)")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                                .opacity(selectedNutrient == nil ? 1 : 0)
                            Text(selectedNutrient?.name ?? nutrients.first?.name ?? "")
                                .font(.title2.bold())
                                .foregroundColor(.primary)
                            Text((selectedNutrient?.quantity.formatted() ?? nutrients.first?.quantity.formatted() ?? "") + " quantity")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                        .position(x: frame.midX, y: frame.midY)
                    }
                }
            }
        }
    }
}

