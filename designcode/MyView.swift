//
//  SwiftUIView.swift
//  designcode
//
//  Created by kehinde on 01/07/2023.
//

import SwiftUI

struct MyView: View {
    var body: some View {
      
        HStack{
            HStack{
                NavigationLink(destination: ContentView()){
                    VStack(spacing:10) {
                        Image(systemName: "house").imageScale(Image.Scale.medium).foregroundColor(.black)
                        Text("Home").font(Font.custom("DMSans-Regular", size: 13)).foregroundColor(.black)
                        
                    }
                }
                Spacer()
                
                NavigationLink(destination: Plans()){
                    VStack(spacing:10) {
                        Image(systemName: "dollarsign.circle").imageScale(Image.Scale.medium).foregroundColor(.black)
                        Text("Plans").font(Font.custom("DMSans-Regular", size: 13)).foregroundColor(.black)
                        
                    }
                }
             
                Spacer()
                VStack(spacing:10) {
                    Image(systemName: "wallet.pass").imageScale(Image.Scale.medium).foregroundColor(.black)
                    Text("Wallet").font(Font.custom("DMSans-Regular", size: 13)).foregroundColor(.black)
                    
                }
                Spacer()
                VStack(spacing:10) {
                    Image(systemName: "book").imageScale(Image.Scale.medium).foregroundColor(.black)
                    Text("Feed").font(Font.custom("DMSans-Regular", size: 13)).foregroundColor(.black)
                    
                }
                Spacer()
                VStack(spacing:10) {
                    Image(systemName: "house").imageScale(Image.Scale.medium).foregroundColor(.black)
                    Text("More").font(Font.custom("DMSans-Regular", size: 13)).foregroundColor(.black)
                    
                }
            }.padding(.horizontal , 10  ).padding(.vertical , 20)
         
            Spacer()
        }.background(.white).shadow(radius: 20)
        
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
