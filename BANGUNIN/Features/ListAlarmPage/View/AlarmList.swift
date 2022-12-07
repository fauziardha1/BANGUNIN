//
//  AlarmList.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 13/11/22.
//

import SwiftUI

struct AlarmList: View {
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .leading){
                    searchComponent()
                    Text("Category")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.leading, 35)
                    roundedView()
                    AlarmView()
                        .background(Color("bg"))
                    Spacer()
                }
                .navigationTitle("Alarm List")
            }
        }
    }
}

struct AlarmGenerator : Hashable{
    var imageUrl : String
    var name : String
}

struct AlarmView: View {
    var list : [AlarmGenerator] = [AlarmGenerator(imageUrl: "stasiun_bdg", name: "Stasiun Cisauk"), AlarmGenerator(imageUrl: "stasiun_gambir", name: "Stasiun Kebayoran"), AlarmGenerator(imageUrl: "monas", name: "Stasiun Bandung")]
    
    var body: some View {
        NavigationView {
            List{
                ForEach(list, id: \.self){ place in
                    HStack{
                        CreateList(label: place.name, image: place.imageUrl)
                    }
                    .swipeActions{
                        Button{
                            print("delete")
                        } label: {
                            Label("", systemImage: "trash.fill")
                        }
                        .tint(.red)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false){
                        Button{
                            print("edit")
                        } label: {
                            Label("", systemImage: "pencil")
                        }
                        .tint(.orange)
                    }
                }
            }
            
        }
    }
}


struct roundedView: View {
    let categories: [String] = ["All", "Jakarta", "Bandung", "medan"]
    
    var body: some View {
        ScrollView {
            HStack {
                ForEach(categories, id: \.self) { category in
                    ZStack{
                        rounded()
                        Text(category.description.capitalized)
                            .padding(.leading)
                    }
                }
            }
        }
    }
}

struct searchComponent: View {
    var  body: some View{
        HStack{
            SearchBar(color: Color("bg"))
                .padding()
            buttonGenerator(name: "doc.text.magnifyingglass", color: Color("icon"))
                .padding(.trailing, 50)
        }
    }
}

struct buttonGenerator: View {
    var name: String
    var color: Color
    
    var body: some View {
        Image(systemName: name)
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundColor(color)
    }
}

struct CreateList: View {
    var label: String
    var image: String
    
    var body: some View {
        ZStack (alignment: .center) {
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                    .padding(.all, 10)
                VStack(alignment: .leading){
                    Text(label)
                        .font(.title3)
                    Text("notify in 500 m")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                Spacer()
                buttonGenerator(name: "bell.fill", color: .green)
                    .padding()
            }
        }
//        .padding(.trailing, 15)
//        .padding(.leading, 15)
    }
}

struct rounded: View{
    var body: some View {
        RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(.green)
            .frame(width: 80, height: 50)
            .padding(.leading)
    }
}

struct AlarmList_Previews: PreviewProvider {
    static var previews: some View {
        AlarmList()
    }
}


//            RoundedRectangle(cornerRadius: 20.0)
//                .fill(Color.white)
//                .shadow(radius: 1)
//                .frame(height: 100)
