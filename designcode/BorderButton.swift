//
//  BorderButton.swift
//  designcode
//
//  Created by kehinde on 22/07/2023.
//

import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity) // Make the button take full width
            .background(.white)
            .border(Color.gray , width: 0)
            .cornerRadius(8).overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray,lineWidth: 1)
            )
    }
}


struct BorderButton: View {
    
    var body: some View {
        VStack {
            
            Button(action: {
                print("Button action")
            } , label: {
                HStack{
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.system(size: 13, weight: .bold))
                    Text("Add money").font(Font.custom("DMSans-Regular", size: 13)).foregroundColor(Color.black)
                    
                }            }).buttonStyle(BlueButton())
            
        }.background(Color.white).padding(.bottom , 20)
    }
    
}

struct BorderButton_Previews: PreviewProvider {
    static var previews: some View {
        BorderButton()
    }
}
