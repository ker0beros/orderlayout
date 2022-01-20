//
//  MainTabLayout.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct MainTabLayout: View {
    @State var index = 1
    @State var offset: CGFloat = 0
    
    var body: some View {
        VStack (spacing: 0){
            TabHeaderView(index: self.$index, offset: self.$offset)
            
            TabItemGroupView()
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainTabLayout_Previews: PreviewProvider {
    static var previews: some View {
        MainTabLayout()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
