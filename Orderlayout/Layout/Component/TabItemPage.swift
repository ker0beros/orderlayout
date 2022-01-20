//
//  TabItemComponent.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct TabItemPage: View {
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 6)
    let items: [String]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns) {
                ForEach(1...12, id: \.self) { index in
                    let rand = Int.random(in: 0...4)
                    TabItemCell(item: items[rand])
                }
            }.padding(.top)
            Spacer()
        }
    }
}

struct TabItemComponent_Previews: PreviewProvider {
    static let array = ["Newspaper", "Snacks", "Drinks", "Food", "Dessert"]
    static var previews: some View {
        TabItemPage(items: array)
.previewInterfaceOrientation(.landscapeLeft)
    }
}
