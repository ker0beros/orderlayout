//
//  TabItemCell.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct TabItemCell: View {
    var item: String
    var column: Int
    var row: Int
    var geo: GeometryProxy
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(.yellow)
            .frame(width: getCellWidth(), height: getCellHeight())
            .padding()
            .overlay(
                Text(item)
                    .foregroundColor(.white)
            )
    }
    
    private func getCellWidth() -> CGFloat{
        return ((geo.size.width - CGFloat(column * 10))/CGFloat(column))
    }
    private func getCellHeight() -> CGFloat{
        return ((geo.size.width - CGFloat(column * 10))/CGFloat(column))
    }
}

struct TabItemCell_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            TabItemCell(item: "Item 1",column: 6, row: 2, geo: geo)
        }
    }
}
