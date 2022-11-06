//
//  ContentView.swift
//  Biometrics
//
//  Created by Omar on 06/11/2022.
//

import SwiftUI

//For face id authentication
import LocalAuthentication


struct ContentView: View {
    
    //To change the view based on the authentication status
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            // check whether the device supports biometric authentication
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "We need to unlock your data"
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success {
                        //Authenticated successfully
                        isUnlocked = true
                    } else {
                        //Failed top authenticate
                        print("Failed to authenticate")
                    }
                    
                }
            } else {
                //No Biometrics
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
