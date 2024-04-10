//
//  SwitchRemember.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 10/4/24.
//

import SwiftUI

struct SwitchRemember: View {
    @State var remember: Bool
    
    var body: some View {
        HStack {
            Toggle(isOn: $remember) {
                Text("Recordar")
            }
            .toggleStyle(SwitchToggleStyle(tint: remember ? Color.customBlue : Color.gray))

        }
        .foregroundColor(.customWhite)
        .padding([.leading,
                    .trailing],
                   130)
    }
}

#Preview {
    SwitchRemember(remember: true)
}
