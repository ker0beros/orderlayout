//
//  MainTabLayout.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct MainTabLayout: View {
    @EnvironmentObject var tm: ApiManager
    @EnvironmentObject var vm: TabViewModel
//    @State var groupIndex: Int?
//    @State var pageIndex: Int = 0
    
    //At Header, get pages that have matching groupId
        //Pass pageId to TabItemGroupView
    //At TabGroupView, get pages that match pageId given
        //Pass cells to display

    var body: some View {
        VStack (spacing: 0){
            if (tm.isLoading) {
                LoadingView()
            } else {
                TabHeaderView(groupIndex: $tm.groupIndex, pageIndex: $tm.pageIndex)
                
                TabItemGroupView(pageIndex: $tm.pageIndex, groupIndex: $tm.groupIndex)
                Spacer()
            }
        }.onAppear {
            tm.fetchOrderLayout()
        }
    }
}

struct MainTabLayout_Previews: PreviewProvider {
    static var previews: some View {
        MainTabLayout()
            .environmentObject(ApiManager())
.previewInterfaceOrientation(.landscapeLeft)
    }
}
