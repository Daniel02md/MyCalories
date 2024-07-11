//
//  registerView.swift
//  Mycalorie
//
//  Created by Guilherme Pessoa on 04/07/24.
//

import SwiftUI

struct InputView: View {
    @EnvironmentObject private var router: AppRouter
    @StateObject var viewModel = InputViewViewModel()
    
    var body: some View {
        VStack {
            Image("bike")
                .resizable()
                .aspectRatio(contentMode: .fill)
            Spacer()
            HeaderView(name: "Tell us about yourself", fonT: .title)
            
            HeaderView(name: "Personalize your experience. Create your profile.", fonT: .subheadline)
            
            Form{
                TextField("Age",value: $viewModel.Age, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .frame(height: 20)
                    .padding(-12)
                
                
                TextField("Height(cm)",value:$viewModel.Height, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .frame(height: 20)
                    .padding(-12)
                
                TextField("weight(kg)",value:$viewModel.Weight, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .frame(height: 20)
                    .padding(-12)
                Picker("Objective",selection: $viewModel.SelectedObjective){
                    ForEach(Objective.allCases){ objetive in Text(objetive.descriptionO).tag(objetive)
                    }
                }
                
                
                Picker("Activity",selection: $viewModel.SelectedActivity){
                    ForEach(Activity.allCases){ activity in Text(activity.descriptionA).tag(activity)
                    }
                }
                
                
                Picker("Gender",selection: $viewModel.SelectedGender){
                    ForEach(Gender.allCases){ gender in Text(gender.rawValue.capitalized)
                    }
                }
                
                
                
            }
            .padding(-12)
            .frame(height: 300)
            .padding(-12)
            
            
            
            .textFieldStyle(.roundedBorder)
            TLButtonView(name: "Finish profile", background: .green) {
                viewModel.calculateCalories()
                viewModel.calculateMacros()
                router.navigate(to: .MainPage)
            }
            .offset(y:8)
            
        }
        .background(Color.white)
        
        .offset(y: 20)
    }
}



struct inputView_Previews:PreviewProvider{
    static var previews: some View{
        InputView()
    }
}

