//
//  TabHeaderView.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct TabHeaderView: View {
    @Binding var index : Int
    
    var body: some View {
        //VStack to stack header and bottom border
        //Hstack to stack header 
        VStack (alignment: .leading, content: {

            HStack {
                Button(action: {
                    self.index = 1
                }) {
                    VStack {
                        Text("Tab 1")
                            .foregroundColor(self.index == 1 ? .white : .white.opacity(0.7))
                        Capsule()
                            .fill(self.index == 1 ? .white : .clear)
                            .frame(height: 4)
                    }
                }
                Button(action: {
                    self.index = 2
                }) {
                    VStack {
                        Text("Tab 2")
                            .foregroundColor(self.index == 2 ? .white : .white.opacity(0.7))
                        Capsule()
                            .fill(self.index == 2 ? .white : .clear)
                            .frame(height: 4)
                    }
                }
                Button(action: {
                    self.index = 3
                }) {
                    VStack {
                        Text("Tab 3")
                            .foregroundColor(self.index == 3 ? .white : .white.opacity(0.7))
                        Capsule()
                            .fill(self.index == 3 ? .white : .clear)
                            .frame(height: 4)
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