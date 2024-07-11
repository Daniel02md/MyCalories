//
//  SearchPage.swift
//  MyCalories
//
//  Created by Marcos Bezerra on 10/07/24.
//

import SwiftUI
import SwiftUI

struct SearchPage: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    private var isCompact: Bool { horizontalSizeClass == .compact }
    #else
    private let isCompact = false
    #endif
    
    @State private var searchText: String = ""
    
    @State private var foodsArray: [Food] = [
        Food(name: "Apple", count: "1", measurement: "g", calories: "95", proteins: "0.5", fat: "0.3"),
        Food(name: "Banana", count: "1", measurement: "g", calories: "105", proteins: "1.3", fat: "0.4"),
        Food(name: "Orange", count: "1", measurement: "g", calories: "62", proteins: "1.2", fat: "0.2"),
        Food(name: "Strawberry", count: "5", measurement: "g", calories: "20", proteins: "0.1", fat: "0.1"),
        Food(name: "Grapes", count: "10", measurement: "g", calories: "30", proteins: "0.1", fat: "0.1"),
        Food(name: "Blueberry", count: "20", measurement: "g", calories: "40", proteins: "0.5", fat: "0.2")
    ]
    @State private var sortOrder = [KeyPathComparator(\Food.name)]
    var body: some View {
        VStack {
            Table(foodsArray, sortOrder: $sortOrder) {
                TableColumn("Drop") { food in
                    Button {
                        foodsArray.removeAll(where: { $0.id == food.id })
                    } label: {
                        Image(systemName: "trash")
                    }
                }
                TableColumn("Name", value: \.name)
            }
        
            List {
                ForEach(foodsArray) { food in
                    let caloriesFormatted = String(format: "%.2f", Double(food.calories) ?? 0)
                    let countFormatted = String(format: "%.2f", Double(food.count) ?? 0)
                    
                    HStack {
                        Button {
                            foodsArray.removeAll(where: { $0.id == food.id })
                        } label: {
                            Image(systemName: "trash")
                        }
                        
                        Spacer()
                        Text(food.name)
                        Spacer()
                        Text("\(countFormatted) \(food.measurement)")
                        Spacer()
                        Text(caloriesFormatted)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .onDelete(perform: { indexSet in
                    foodsArray.remove(atOffsets: indexSet)
                })
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .searchable(text: $searchText, placement: .toolbar)
    }
}

struct Food: Identifiable {
    var id: UUID = UUID()
    var name: String
    var count: String
    var measurement: String
    var calories: String
    var proteins: String
    var fat: String
}
#Preview {
    RouterView {
        SearchPage()
    }
}
