//
//  HomeView.swift
//  SwiftUI-Tuturial-Restart (iOS)
//
//  Created by Aldanis Vigo on 7/3/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
//            Color.white
//                .ignoresSafeArea(.all,edges: .all)
            
            VStack(spacing: 20){
                //Mark - Header
                Spacer()
                ZStack {
                    CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35 : -35)
                        .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
                }
                
                //Mark - Center
                Text("The time that leads to mastery is dependent on the intensity of our focus")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
                //Mark - Footer
                Spacer()
                
                Button(action: {
                    withAnimation {
                        playSound(sound: "success", type: "m4a")
                        isOnboardingViewActive = true
                    }
                }){
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            } // VStack
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3, execute: {
                    isAnimating = true
                })
        })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
