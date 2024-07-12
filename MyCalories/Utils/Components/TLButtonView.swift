//
//  TLButton.swift
//  Mycalorie
//
//  Created by Guilherme Pessoa on 04/07/24.
//

import SwiftUI

struct TLButtonView: View {
    let name: String
    let background: Color
    var action: () -> Void
    var body: some View {
        Button{
      action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(background)
                    .padding()
                    .frame(height: 80)
                Text(name)
                    .foregroundColor(Color.black)
                    .bold()
            }
            
        }
    }
}

struct TLButton_previews: PreviewProvider {
    static var previews: some View{
        TLButtonView(name:"value",background: .green) {
            
        }
        
    }
}

