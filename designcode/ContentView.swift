//
//  ContentView.swift
//  designcode
//
//  Created by kehinde on 29/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab:Tab = .bookmark
    
    var body: some View {
        TabView(selection:$currentTab){
            Home().tag(Tab.bookmark)
            Text("Title").tag(Tab.title)
            Text("Title==").tag(Tab.fav)
        }.edgesIgnoringSafeArea(.all)
        CustomTabBar(currentTab: $currentTab)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
