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

struct rounded: View{
    var body: some View {
        RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(.green)
            .frame(width: 80, height: 50)
            .padding(.leading)
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
//    var images = [Image("monas") ,Image("stasiun_bdg"),Image("stasiun_gambir")]
    
    var body: some View {
        ZStack (alignment: .center) {
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.white)
                .shadow(radius: 1)
                .frame(height: 100)
            HStack{
                Image("monas")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                    .padding(.all, 10)
                Text(label)
                    .font(.title3)
                    .padding(.all, 15)
                Spacer()
                buttonGenerator(name: "bell.fill", color: .green)
                    .padding()
            }
        }
        .padding(.trailing, 15)
        .padding(.leading, 15)
    }
}

struct AlarmView: View {
    var places = ["Stasiun Rawamangun","Stasiun Rawabuntu","Stasiun Kebayoran"]
    
    var body: some View {
        VStack{
            ForEach(places, id: \.self){ place in
                HStack{
                    CreateList(label: place)
                }
            }
            .padding(.top, 10)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom, 10)
        }
    }
}

struct AlarmList_Previews: PreviewProvider {
    static var previews: some View {
        AlarmList()
    }
}



// ["\(Image("monas"))" ,"\(Image("stasiun_bdg"))","\(Image("stasiun_gambir"))"]

//
//struct ImageGenerator: View {
//    var image = [images]
//    var body: some View{
//            Image(image)
//                .resizable()
//                .frame(width: 20, height: 20)
//                .cornerRadius(10)
//    }
//}

    //                ForEach(images, id: \.self){ image in
    //                    ImageGenerator(image: image)
    //                }

