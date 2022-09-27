//
//  ContentView.swift
//  BANGUNIN
//
//  Created by FauziArda on 26/09/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentViewModel()
    @State var isActive : Bool = false
    
    var body: some View {
        VStack {
            Toggle("Toggle Your App", isOn: $isActive )
        }
        .padding()
        
        HStack {
            Button("Increment") {
                vm.addCounter()
            }
            .foregroundColor(.blue)
            
            Text("\(vm.counter)")
                .bold()
                .foregroundColor(.gray)
                .padding()
        }
        
        List(vm.itemList) { item in
            HStack{
                Text(item.name)
                Spacer()
                Text("\(item.number)")
            }
        }
        .listStyle(.plain)
        .foregroundColor(.gray)
        
        Button("add item") {
            vm.addItem()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
