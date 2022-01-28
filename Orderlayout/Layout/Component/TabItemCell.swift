//
//  TabItemCell.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 19/01/2022.
//

import SwiftUI

struct TabItemCell: View {
    var item: Cell
    var column: Int
    var row: Int
    var geo: GeometryProxy
    
    //IF actionType = OrderLayout\Group
        //use actionID as new groupID
    
    var body: some View {
        Button(action: {
            ApiManager().checkActionType(cell: item)
        }) {
            Text(item.action.name)
                .foregroundColor(.white)
                .cornerRadius(25)
                .padding()
                .frame(width: getCellWidth(), height: getCellHeight())
        }.background(.yellow)
            .cornerRadius(25)
    }
    
    private func getCellWidth() -> CGFloat{
        
        return ((geo.size.width - CGFloat(column * 10))/CGFloat(column))
    }
    private func getCellHeight() -> CGFloat{
        return ((geo.size.width - CGFloat(column * 10))/CGFloat(column))
    }
}

//struct TabItemCell_Previews: PreviewProvider {
//    static var cell = Cell(color: Color.ea9999, updatedAt: "2022-01-19T07:08:12.000Z", id: "61ee0e011d14030006f28cba", cellID: 97950, x: 0, y: 0, actionID: 1, actionType: Cell.ActionType.group, pageID: 210, createdAt: "2022-01-19T07:08:12.000Z", action: Action(id: 1, name: "NEWSPAPER", createdAt: "2019-07-06T01:31:48+0800", updatedAt: "2019-07-06T01:31:48+0800", deletedAt: nil))
//
//    static var previews: some View {
//        GeometryReader { geo in
//            TabItemCell(item: cell,column: 6, row: 2, geo: geo)
//        }
//    }
//}
