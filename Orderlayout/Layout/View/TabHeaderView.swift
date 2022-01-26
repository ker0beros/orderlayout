//
//  TabHeaderView.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct TabHeaderView: View {
    @Binding var index : Int
    @EnvironmentObject var tm: tokenManager
    
    var body: some View {
        //VStack to stack header and bottom border
        //Hstack to stack header 
        VStack (alignment: .leading, content: {

            HStack {
                ForEach(tm.pages) { tab in
                    if (tab.groupID == nil) {
                        Button(action: {
                            self.index = tab.pageID
                        }) {
                            VStack {
                                Text(tab.name)
//                                    .foregroundColor(self.index == tab.id ? .white : .white.opacity(0.7))
                                    .foregroundColor(.white.opacity(0.7))
                                Capsule()
//                                    .fill(self.index == tab.id ? .white : .clear)
                                    .fill(.clear)
                                    .frame(height: 4)
                            }
                        }
                    }
                }
            }
            .padding(.top)
            .padding(.horizontal)
            .padding(.bottom, 10)
            .background(.red)
//            .animation(.default)
        })
    }
}

struct TabHeaderView_Previews: PreviewProvider {
    @State static var index : Int = 1
    static var previews: some View {
        TabHeaderView(index: self.$index)
.previewInterfaceOrientation(.landscapeLeft)
    }
}
