//
//  TabItemComponent.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct TabItemPage: View {
    @EnvironmentObject var tm: tokenManager
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 6)
    let items: [String]
    let geo: GeometryProxy
    
//    init(items: [String], geo: GeometryProxy) {
//        guard let order = tm.order else {
//            return
//        }
////        order = tm.order?.self
//        self.items = items
//        self.geo = geo
//    }
    
    var body: some View {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(1...12, id: \.self) { index in
                        let rand = Int.random(in: 0...4)
                        TabItemCell(item: items[rand], column: tm.width, row: tm.height, geo: geo)
                    }
                }.padding(.top)
                    .padding(.leading)
                    .padding(.trailing)
                Spacer()
            }
    }
}

struct TabItemComponent_Previews: PreviewProvider {
    static let array = ["Newspaper", "Snacks", "Drinks", "Food", "Dessert"]
    static var previews: some View {
        GeometryReader { proxy in
            TabItemPage(items: array, geo: proxy)
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}
