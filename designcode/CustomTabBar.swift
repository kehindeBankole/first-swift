//
//  CustomTabBar.swift
//  designcode
//
//  Created by kehinde on 11/09/2023.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab:Tab
    var body: some View {
        
        HStack{
            ForEach(Tab.allCases , id:\.rawValue){ tab in
                Spacer()
                Button{
                    currentTab = tab
                    print(tab)
                }label:{
                    Image(systemName: tab.rawValue == "Bookmark" ? "bolt" : tab.rawValue=="Title" ? "camera" :  "heart").foregroundColor(.black)
                }
                Spacer()
                
            }
        }.frame(maxWidth: .infinity).frame(height:30)
            .padding(.bottom , 10)
            .padding([.horizontal , .top]).shadow(radius: 15).shadow(radius: 8)
        
    }
    
    //
    //    func getIndex()->Int{
    //        switch currentTab{
    //        case.bookmark:
    //            return 0
    //        case .title:
    //            return 1
    //        default :
    //            return 2
    //        }
    //
    //    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
