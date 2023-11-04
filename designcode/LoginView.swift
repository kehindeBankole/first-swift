//
//  LoginView.swift
//  designcode
//
//  Created by kehinde on 20/08/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(alignment: .leading , spacing: 10){
            Text("Welcome Back").font(Font.custom("DMSans-Bold", size: 32))
            Text("Let's get you logged in to get back to building your dollar-denominated investment portfolio.").foregroundColor(.gray).font(Font.custom("DMSans-Regular", size: 16))
        }
        Spacer()
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environment(\.font, Font.custom("DMSans-Regular", size: 16))
    }
}
