//
//  customTabBar.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 16/11/22.
//

import SwiftUI

struct customTabBar: View {
    
    @StateObject var router: TabRouter
    @State var condition = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                switch router.screen {
                case .homepage:
                    MapPage()
                case .listpage:
                    AlarmList()
                case .addAlarmPage:
                    AddNewView()
                }
//                Spacer()
                HStack {
                    TabBarIcon(router: router, screen: .homepage, width: geometry.size.width/3, height: geometry.size.height/20, systemIconName: "house", tabName: "Map")

                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width/5, height: geometry.size.width/5)
                            .shadow(radius: 4)
                        
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width/5.5-5 , height: geometry.size.width/5.5-5)
                            .foregroundColor(Color("primary"))
                    }.offset(y: -geometry.size.height/8/2)
                        .onTapGesture{
                            condition = true
                        }
                    
                    TabBarIcon(router: router, screen: .listpage, width: geometry.size.width/3, height: geometry.size.height/20, systemIconName: "bookmark.fill", tabName: "List")
                }.frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color("bg").shadow(radius: 2))
            } .edgesIgnoringSafeArea(.bottom)
        }.navigate(to: AddNewView(), when: $condition)
    }
}

struct TabBarIcon: View {
    
    @StateObject var router: TabRouter
    let screen: Screen
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
        .onTapGesture {
            router.screen = screen
        }.foregroundColor(router.screen == screen ? Color("primary") : .gray)
    }
}

struct customTabBar_Previews: PreviewProvider {
    static var previews: some View {
        customTabBar(router: TabRouter())
    }
}

//Navigation function
extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true), // for cannot back when swipe
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
        
    }
}
