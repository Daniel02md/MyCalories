//
//  registerView.swift
//  Mycalorie
//
//  Created by Guilherme Pessoa on 04/07/24.
//

import SwiftUI
import Combine

struct InputView: View {
    @State private var isActive = false
    @StateObject var viewModel = InputViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                Image("bike")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                Spacer()
                HeaderView(name: "Tell us about yourself", fonT: .title)
                HeaderView(name: "Personalize your experience. Create your profile.", fonT: .subheadline)
                
                Form{
                    TextField("Age",value:$viewModel.Age, formatter: NumberFormatter.decimalFormatter)
                        .keyboardType(.numberPad)
                        .frame(height: 20)
                        .padding(-12)
                    
                    
                    TextField("Height(cm)",value:$viewModel.Height, formatter: NumberFormatter.decimalFormatter)
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
                
                
                
                TLButtonView(name: "Finish profile", background: .green, destination: MainPage()) {
                    if viewModel.Validate() {
                        viewModel.calculateCalories()
                        viewModel.calculateMacros()
                        isActive = true
                        
                    }
                }
                .navigationBarBackButtonHidden(true)
                
                .offset(y:8)
                .navigationDestination(isPresented: $isActive) {
                    LabelCView()
                        .environmentObject(viewModel)
                }
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundStyle(Color.red)
                        .padding()
                }
            }
            .offset(y: 20)
            
        }
        //.navigationBarBackButtonHidden(true)
    }
}



struct inputView_Previews:PreviewProvider{
    static var previews: some View{
        InputView()
            .environmentObject(InputViewViewModel())
    }
}

