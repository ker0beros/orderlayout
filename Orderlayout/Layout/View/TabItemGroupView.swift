//
//  TabItemGroupView.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct TabItemGroupView: View {
    @EnvironmentObject var vm: ApiManager
    @Binding var pageIndex: Int
    @Binding var groupIndex: Int?
    
    var body: some View {
        GeometryReader { proxy in
            TabView (selection: $pageIndex) {
                ForEach(vm.pages) { tab in
                    if (tab.groupID == groupIndex) {
                        TabItemPage(items: tab.cells, geo: proxy).tag(tab.pageID)
                    }
                }
            }.tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct TabItemGroupView_Previews: PreviewProvider {
    @State static var pageIndex: Int = 0

    static var previews: some View {
        TabItemGroupView(pageIndex: .constant(0), groupIndex: .constant(nil))
.previewInterfaceOrientation(.landscapeLeft)
    }
}
