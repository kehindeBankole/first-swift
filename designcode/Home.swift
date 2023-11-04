//
//  ContentView.swift
//  designcode
//
//  Created by kehinde on 01/07/2023.
//

import SwiftUI

struct EyeToggle:ToggleStyle{
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName:configuration.isOn ? "eye.slash"  :"eye")
            .font(.system(size: 14))
            .foregroundColor(.black).onTapGesture {
                withAnimation{
                    configuration.$isOn.wrappedValue.toggle()
                    
                }                           }
    }
}
struct Home: View {
    enum Res {
        case morning
        case afternoon
        case evening
    }
    @State private var timeOfDay:Res = .morning
    @EnvironmentObject var appData : AppData
    
    func updateTimeOfDay() {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())
        
        switch hour {
        case 0..<12:
            timeOfDay =  .morning
        case 12..<17:
            timeOfDay = .afternoon
        default:
            timeOfDay = .evening
        }
    }
    // an array of integer type
    @State private var numbers : [Int] = [2, 4, 6, 8,10]
    @State var toggleBalance:Bool = false
    @State var totalBalance : Int = 0
    
    
    var body: some View {
        NavigationStack{
            
            
            ScrollView(showsIndicators: false){
                
                VStack{
                    
                    HStack{
                        VStack{
                            Group{
                                VStack(alignment: .leading , spacing: 10){
                                    HStack{
                                        Text("Good \(timeOfDay == .morning ? "Morning 🌦️": timeOfDay == .afternoon ? "Afternoon ☀️" : "Evening 🌃")").foregroundColor(Color.black)
                                    }
                                    Text("Rokudaime").foregroundColor(Color.black).fontWeight(.medium)
                                }
                            }.font(Font.custom("DMSans-Regular", size: 16))
                        }
                        
                        Spacer()
                        HStack {
                            Button(action: {
                                print("notificaion")
                            }, label: {
                                Image(systemName: "bell").imageScale(Image.Scale.large).foregroundColor(.black).symbolVariant(.fill)
                            })
                        }
                        
                        
                    }.padding(.horizontal,15).background(Color.white)
                }.onAppear {
                    updateTimeOfDay()
                    for plan in appData.plansModel {
                        totalBalance+=plan.amount
                    }
                }
                VStack{
                    //  Spacer()
                    RoundedRectangle(cornerRadius: 25)
                        .frame(height: 150)
                        .foregroundColor(.blue)
                        .padding()
                    
                    
                    RoundedRectangle(cornerRadius: 25)
                        .padding().frame(height: 180).foregroundColor(.white).shadow(radius: 15)
                        .overlay(
                            VStack(alignment: .center , spacing: 10){
                                
                                HStack{
                                    
                                    Text("Total Balance")
                                        .font(Font.custom("DMSans-Regular", size: 13))
                                        .foregroundColor(.black)
                                    
                                    Toggle(isOn: $toggleBalance, label: {
                                        
                                    }).labelsHidden().toggleStyle(EyeToggle())
                                }
                                Grid(alignment: .center , verticalSpacing: 13){
                                    
                                    GridRow{
                                        
                                        Text(!toggleBalance ? "$\(totalBalance)" : "******")
                                            .font(Font.custom("DMSans-Regular", size: 30))
                                            .foregroundColor(.black)
                                    }.gridCellColumns(3)
                                    GridRow{
                                        Text("Total Gains")
                                            .font(Font.custom("DMSans-Regular", size: 13))
                                            .foregroundColor(.black)
                                        Image(systemName: "arrow.up.right")
                                            .font(.system(size: 14))
                                            .foregroundColor(.green)
                                        Text("0.38%")
                                            .font(Font.custom("DMSans-Regular", size: 13))
                                            .foregroundColor(.green)
                                    }
                                }
                            }
                            
                        )
                    
                }.background(Color.white)
                
                VStack{
                    BorderButton()
                    ScrollViewReader{proxy in
                        ScrollView(.horizontal , showsIndicators: false){
                            LazyHStack(spacing:25){
                                ForEach(appData.plansModel, id: \.self) { number in
                                    
                                    ZStack{
                                        Image("stock")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 188, height: 254)
                                            .cornerRadius(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .foregroundColor(Color.black.opacity(0.3))
                                            )
                                        HStack{
                                            VStack(alignment: .leading , spacing:5){
                                                Spacer()
                                                Text(number.name).foregroundColor(.white).font(Font.custom("DMSans-Regular", size: 14))
                                                Text("$\(number.amount)").foregroundColor(.white).font(Font.custom("DMSans-Regular", size: 16))
                                                Text("\(number.type)").foregroundColor(.white).font(Font.custom("DMSans-Regular", size: 14))
                                            }.padding()
                                            Spacer()
                                        }
                                        
                                    }
                                }
                                
                                Button(action: {
                                    withAnimation{
                                        proxy.scrollTo(appData.plansModel[0])
                                    }
                                    
                                }, label: {
                                    Image(systemName: "arrow.left")
                                })
                                
                                
                                
                                
                            }
                        }
                    }
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Customer Corner").font(Font.custom("DMSans-Regular", size: 22))
                            Spacer()
                        }
                    }.padding([.top] , 20)
                }.background(Color.white).padding()
                
                
                
            }
            .background(Color.white).safeAreaInset(edge: .top, content: {
                HStack{
                }.frame(maxWidth: .infinity).background(.white)
            })
        }    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
      Home().environmentObject(AppData())
        
    }
}

