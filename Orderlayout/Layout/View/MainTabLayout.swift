//
//  MainTabLayout.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct MainTabLayout: View {
    @State var index = 1
    @EnvironmentObject var tm: tokenManager

    var body: some View {
        VStack (spacing: 0){
            if (tm.pages.count < 1) {
                LoadingView()
            } else {
                TabHeaderView(index: self.$index)
                
                TabItemGroupView(tabIndex: self.$index)
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
            .environmentObject(tokenManager())
.previewInterfaceOrientation(.landscapeLeft)
    }
}
