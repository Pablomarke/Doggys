//
//  FireBaseLogViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 27/3/24.
//

import Firebase

class FirebaseLogViewModel: LogProtocol {
    
    func log(screen: String, action: String) {
        Analytics.logEvent(action, 
                           parameters: [
                            AnalyticsParameterScreenName: screen,
                            "custom_key": ""
                           ])
    }
    
    func crash(screen: String, exception: Error) {
        // TODO: create crash
    }
}
