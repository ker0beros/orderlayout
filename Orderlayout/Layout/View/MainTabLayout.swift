//
//  MainTabLayout.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct MainTabLayout: View {
    @State var index = 1
    
    var body: some View {
        VStack (spacing: 0){
            TabHeaderView(index: self.$index)

            TabItemGroupView(tabIndex: self.$index)
            Spacer()
        }
    }
}

struct MainTabLayout_Previews: PreviewProvider {
    static var previews: some View {
        MainTabLayout()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
