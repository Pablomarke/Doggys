//
//  TextPickerView.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 15/4/24.
//

import SwiftUI

struct TextPickerView<T: Hashable & CustomStringConvertible>: View {
    @Binding var selectedItem: T
    var text: String
    var items: [T]
    
    var body: some View {
        VStack {
            Text(text)
                .foregroundStyle(Color.customWhite)
                .font(.custom("Jost-Light",
                              size: 24))
            Picker(selection: $selectedItem,
                   label: Text("")) {
                ForEach(items,
                        id: \.self) { item in
                    Text(item.description)
                }
            }
                   .padding(.top, 0)
                   .pickerStyle(.menu)
        }
    }
}
