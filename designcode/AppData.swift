//
//  AppData.swift
//  designcode
//
//  Created by kehinde on 26/08/2023.
//

import SwiftUI
struct Plan : Hashable {
    var name : String
    var amount : Int
    var type : String
}

//struct plansViewModel : Hashable{
//
//    var plan : Plan
//    var id = UUID()
//
//    var name:String{
//        return plan.name
//    }
//    var  amount:Int{
//       return plan.amount
//    }
//    var type:String{
//        return plan.type
//    }
//}
class AppData:ObservableObject {
    @Published var plansModel:[Plan]
    
    init(){
        plansModel = [
            Plan(name: "growing money", amount: 45000 , type: "Build Wealth"),
            Plan(name: "my stocks", amount: 15000 , type: "Stocks"),
            Plan(name: "my goal plan", amount: 15000 , type: "Goal Plan"),
        ]
        
    }
}
