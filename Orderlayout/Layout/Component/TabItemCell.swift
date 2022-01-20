//
//  TabItemCell.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct TabItemCell: View {
    var item: String
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(.yellow)
            .frame(width: 180, height: 140)
            .overlay(
                Text(item)
                    .foregroundColor(.white)
            )
    }
}

struct TabItemCell_Previews: PreviewProvider {
    static var previews: some View {
        TabItemCell(item: "Item 1")
    }
}
