//
//  ContentView.swift
//  Shared
//
//  Created by Masayuki Hiraoka on 2020/09/09.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    
    var columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        VStack(spacing: 8) {
            SearchBar(text: $text)
            
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: columns) {
                    ForEach(items.filter { text.isEmpty || $0.title.contains(text) }) { item in
                        Text(item.title)
                    }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// MARK: Sample data entity
struct Item: Identifiable {
    var id = UUID()
    var title: String
}

// MARK: Sample data
let items = [
    Item(title: "123"),
    Item(title: "234"),
    Item(title: "456"),
    Item(title: "aaa"),
    Item(title: "bbb"),
    Item(title: "this"),
    Item(title: "is"),
    Item(title: "test"),
    Item(title: "data"),
]
