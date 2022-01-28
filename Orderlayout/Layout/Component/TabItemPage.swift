//
//  TabItemComponent.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct TabItemPage: View {
    @EnvironmentObject var tm: ApiManager
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 6)
    let items: [Cell]
    let geo: GeometryProxy
    
    var body: some View {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(items, id: \.cellID) { item in
                        TabItemCell(item: item, column: tm.width, row: tm.height, geo: geo)
                    }
                }.padding(.top)
                    .padding(.leading)
                    .padding(.trailing)
                Spacer()
            }
    }
}

struct TabItemComponent_Previews: PreviewProvider {
    static let array: [Cell] = []
    static var previews: some View {
        GeometryReader { proxy in
            TabItemPage(items: array, geo: proxy)
        }
.previewInterfaceOrientation(.landscapeLeft)
    }
}
