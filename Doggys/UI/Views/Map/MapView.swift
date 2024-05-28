//
//  MapView.swift
//  Doggys
//
//  Created by Marco Muñoz on 8/4/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var selectedUser: UserProfile? = nil
    @ObservedObject var viewModel: MapViewModel
   
    // MARK: - View -
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.selfRegion,
                showsUserLocation: true,
                annotationItems: viewModel.userProfiles) { users in
                MapAnnotation(coordinate: users.coordinate) {
                    CustomMapIcon()
                        .onTapGesture {
                        selectedUser = users
                    }
                    .frame(width: 100, height: 70)
                    .foregroundColor(.customMain)
                    
                    Image(.logoIcon)
                        .resizable()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                        .offset(y: -73)
                }
            }
            .id(0)
            if let user = selectedUser {
                               VStack{
                                   MapPopupView(nameProfile: user.dogName, gender: user.dogGender.rawValue, years: user.dogYears, friendly: user.dogFriendly.rawValue, longWalk: user.dogWalk.rawValue)
                                           .padding()
                                           .background(Color.white)
                                           .cornerRadius(20)
                                   Button("", systemImage: "x.circle.fill") {
                                       selectedUser = nil
                                   }
                                   .foregroundStyle(.red)
                           }
                           .transition(.move(edge: .top))
                           .animation(.easeInOut)
                       }
            VStack {
                Spacer()
                HStack {
                    CenterMapButton {
                        viewModel.getLocationAndCenter()
                    }
                    Spacer()
                }
                .padding([.leading, .bottom], 16)
            }
        }
        .onAppear {
            viewModel.chargeData()
        }
    }

    mutating func set(viewModel: MapViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    AppTabView()
}
