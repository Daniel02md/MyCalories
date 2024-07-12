//
//  HeaderView.swift
//  MyCalories
//
//  Created by Guilherme Pessoa on 10/07/24.
//

import SwiftUI

struct HeaderView: View {
    let name: String
    let fonT: Font
    var body: some View {
        
            VStack{
                
                Text(name)
                    .font(fonT)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .bold()
                Spacer()
                Spacer()
            }
                
        
        .frame(width: UIScreen.main.bounds.width * 3,height: 30)
        
    }
}

struct HeaderView_previews: PreviewProvider{
    static var previews: some View{
        HeaderView(name: "test",fonT: .title)
    }
    
}

