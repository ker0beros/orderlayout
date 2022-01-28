//
//  TabHeaderView.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct TabHeaderView: View {
    @EnvironmentObject var tm: ApiManager
    @Binding var groupIndex: Int?
    @Binding var pageIndex: Int
    
    var body: some View {
        //VStack to stack header and bottom border
        //Hstack to stack header 
        VStack (alignment: .leading, content: {

            HStack {
                ForEach(tm.pages) { tab in
                    if (tab.groupID == groupIndex) {
                        Button(action: {
                            pageIndex = tab.pageID
                        }) {
                            VStack {
                                Text(tab.name)
                                    .foregroundColor(pageIndex == tab.pageID ? .white : .white.opacity(0.7))
                                Capsule()
                                    .fill(pageIndex == tab.pageID ? .white : .clear)
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
        })
    }
}

struct TabHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TabHeaderView(groupIndex: .constant(nil), pageIndex: .constant(0))
.previewInterfaceOrientation(.landscapeLeft)
    }
}
