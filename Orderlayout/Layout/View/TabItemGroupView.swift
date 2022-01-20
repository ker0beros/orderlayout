//
//  TabItemGroupView.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct TabItemGroupView: View {
    var body: some View {
        TabView {
            TabItemPage()
            TabItemPage()
            TabItemPage()
        }.tabViewStyle(.page(indexDisplayMode: .always))
    }
}

struct TabItemGroupView_Previews: PreviewProvider {
    static var previews: some View {
        TabItemGroupView()
    }
}
