
//
//  FoodView.swift
//  Mycalorie
//
//  Created by Guilherme Pessoa on 03/07/24.
//

import SwiftUI

struct FoodView: View {
    @EnvironmentObject var viewModel: InputViewViewModel
    
    var body: some View {
        
            VStack{
                GroupBox(label: Text("calories")){
                    VStack(alignment: .leading, spacing: 8){
                        Text("daily Calories: \(viewModel.Calories,specifier: "%.0f")")
                        Text("consumed calories: 10")
                        Text("Total calories \(viewModel.Calories - 10,specifier: "%.0f")")
                    }
                    
                }
            .padding()
            }
    }
}

struct foodView_Previews:PreviewProvider{
    static var previews: some View{
        FoodView()
            .environmentObject(InputViewViewModel())
    }
}
