//
//  ContentView.swift
//  Orderlayout
//
//  Created by Khairul Azmi on 19/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tm = tokenManager()
    
    var body: some View {
        MainTabLayout()
            .environmentObject(tm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
