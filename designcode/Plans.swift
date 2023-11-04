//
//  Plans.swift
//  designcode
//
//  Created by kehinde on 28/08/2023.
//

import SwiftUI

struct Plans: View {
    @Environment (\.dismiss) var dismiss
    //    @Binding var path : NavigationPath
    var body: some View {
        Spacer()
        
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem{
                    Button("click"){
                        dismiss()
                    }
                }
            }
        
    }
    
}

struct Plans_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            Plans()
        }
    }
}
