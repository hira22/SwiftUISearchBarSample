//
//  SearchBar.swift
//  SwfitUISearchBarSample
//
//  Created by Masayuki Hiraoka on 2020/09/08.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    @State var editing: Bool = false
    
    var body: some View {
        HStack {
            TextField("Search here...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.leading, 16)
                        
                        Spacer()
                        
                        if editing {
                            Button(action: {
                                text = ""
                                
                            }, label: {
                                Image(systemName: "multiply.circle")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 16)
                            })
                        }
                    }, alignment: .leading
                )
                .onTapGesture {
                    editing = true
                }
            
            
            if editing {
                Button(
                    action: {
                        editing = false
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    },
                    label: {
                        Text("Cancel")
                    }
                )
                .padding(.trailing, 8)
                
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
