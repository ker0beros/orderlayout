//
//  TabItemComponent.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct TabItemPage: View {
    var body: some View {
        HStack {
            TabItemCell(item: "Item 1")
            TabItemCell(item: "Item 2")
            TabItemCell(item: "Item 3")
        }
    }
}

struct TabItemComponent_Previews: PreviewProvider {
    static var previews: some View {
        TabItemPage()
    }
}
