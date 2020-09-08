//
//  ContentView.swift
//  Shared
//
//  Created by Masayuki Hiraoka on 2020/09/09.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    
    var body: some View {
        SearchBar(text: $text)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
