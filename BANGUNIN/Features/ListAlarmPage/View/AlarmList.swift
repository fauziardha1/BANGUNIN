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
                    AlarmView(coreDM: CoreDataManager())
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
    @State private var alarms: [DataAlarm] = [DataAlarm]()
    let coreDM: CoreDataManager
    
    private func allAlarms(){
        alarms = coreDM.getAllAlarms()
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(alarms, id: \.self){ alarm in
                    HStack{
                        CreateList(label: alarm.name ?? "" , image: "stasiun_bdg", rad: alarm.radius ?? "")
                    }
//                    .swipeActions{
//                        Button{
//                            print("delete")
//                        } label: {
//                            Label("", systemImage: "trash.fill")
//                        }
//                        .tint(.red)
//                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false){
                        Button{
                            print("edit")
                        } label: {
                            Label("", systemImage: "pencil")
                        }
                        .tint(.orange)
                    }
                }.onDelete(perform: {
                    IndexSet in IndexSet.forEach{ index in
                        let alarm = alarms[index]
                        coreDM.deleteAlarm(alarm: alarm)
                        allAlarms()
                    }
                })
            }
            .onAppear(perform: {
                allAlarms()
            })
            
        }
    }
}

struct FilterData :  Hashable {
    let city : String
    var isActive : Bool
}


struct roundedView: View {
    var categories: [FilterData] = [
        FilterData(city: "All", isActive: true),
        FilterData(city: "Jakarta", isActive: false),
        FilterData(city: "Bandung", isActive: false),
        FilterData(city: "Malang", isActive: false)
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    BanguninButton(category.city, isActive: category.isActive)
                }
            }
            .padding(.vertical, 6)
            .padding(.horizontal,32)
            
        }
        
    }
    
    @ViewBuilder
    func BanguninButton(_ title : String, isActive : Bool) -> some View {
        
        let color = isActive ? Color(uiColor: UIColor(red: 0.12, green: 0.80, blue: 0.47, alpha: 1.00)) : Color(uiColor: UIColor(red: 0.96, green: 0.96, blue: 0.97, alpha: 1.00))
        
        Button(title) {
            for var category in self.categories {
                if category.city == title {
                    category.isActive = true
                }else{
                    category.isActive = false
                }
            }
            
        }
        .foregroundColor(isActive ? .white : Color(uiColor: UIColor(red: 0.62, green: 0.65, blue: 0.75, alpha: 1.00)))
        .font(.system(size: 18, weight: .medium))
        .padding()
        .background(color)
        .cornerRadius(.infinity)
        .shadow(radius: 1)
        .padding(.trailing)
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
    var rad: String
    
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
                    Text("notify in \(rad) m")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                Spacer()
                buttonGenerator(name: "bell.fill", color: .green)
                    .padding()
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

struct AlarmList_Previews: PreviewProvider {
    static var previews: some View {
        AlarmList()
    }
}
