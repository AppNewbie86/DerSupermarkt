//
//  ContentView.swift
//  DerSupermarkt
//
//  Created by Marcel Zimmermann on 03.02.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex : Int = 0

    
    @StateObject var viewModel = MitarbeiterViewModel()
    var body: some View {
        MitarbeiterInventarTabView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MitarbeiterInventarTabView()
    }
}
