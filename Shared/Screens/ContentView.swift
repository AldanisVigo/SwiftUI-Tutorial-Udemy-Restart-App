//
//  ContentView.swift
//  Shared
//
//  Created by Aldanis Vigo on 7/3/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingviewActive: Bool = true
    
    var body: some View {
        ZStack{
            if isOnboardingviewActive {
                OnboardingView()
            }else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
