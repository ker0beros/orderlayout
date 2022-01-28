//
//  ContentView.swift
//  Orderlayout
//
//  Created by Khairul Azmi on 19/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var tm = ApiManager()
    @StateObject var vm = TabViewModel()
    
    var body: some View {
        MainTabLayout()
            .environmentObject(tm)
            .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
