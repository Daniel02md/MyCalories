//
//  MyCaloriesApp.swift
//  MyCalories
//
//  Created by Marcos Bezerra on 03/07/24.
//

import SwiftUI

@main
struct MyCaloriesApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView{
               OnBoardingChoseView()
            }
        }
    }
}
