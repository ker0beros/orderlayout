//
//  TabItemGroupView.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct TabItemGroupView: View {
    @Binding var tabIndex: Int
    
    let item1 = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    let item2 = ["Newspaper", "Snacks", "Drinks", "Food", "Desserts"]
    let item3 = ["Thor", "Superman", "Iron Man", "Hulk", "Captain America"]
    
    var body: some View {
        TabView (selection: $tabIndex) {
            TabItemPage(items: item1).tag(1)
            TabItemPage(items: item2).tag(2)
            TabItemPage(items: item3).tag(3)
        }.tabViewStyle(.page(indexDisplayMode: .always))
            .animation(Animation.easeInOut, value: tabIndex)
    }
}

struct TabItemGroupView_Previews: PreviewProvider {
    @State static var tabIndex: Int = 1
    @State static var offset: CGFloat = UIScreen.main.bounds.width
    
    static var previews: some View {
        TabItemGroupView(tabIndex: self.$tabIndex)
.previewInterfaceOrientation(.landscapeLeft)
    }
}
