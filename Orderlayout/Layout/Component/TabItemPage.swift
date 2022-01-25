//
//  TabItemComponent.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct TabItemPage: View {
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 6)
    let items: [String]
    let geo: GeometryProxy
    
    var body: some View {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(1...12, id: \.self) { index in
                        let rand = Int.random(in: 0...4)
                        TabItemCell(item: items[rand], column: 6, row: 2, geo: geo)
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