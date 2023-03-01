//
//  MainView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI

struct MainView: View {
    @State private var awardIsShowing = false
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                HStack {
                    Text(awardIsShowing ? "Hide Award" : "Show Award")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .scaleEffect(awardIsShowing ? 2 : 1)
                        .rotationEffect(.degrees(awardIsShowing ? 0 : 180))
                }
            }
            
            Spacer()
            if awardIsShowing {
                StarView()
                    .frame(width: 250, height: 250)
                    .transition(.twist())
            }
            Spacer()
        }
        .font(.headline)
        .padding()
    }
    
    private func buttonAction() {
        withAnimation {
            awardIsShowing.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension AnyTransition {
    static func twist() -> AnyTransition {
            let insertion = AnyTransition.modifier(
                active: TwistEffect(angle: .degrees(0)),
                identity: TwistEffect(angle: .degrees(0))
            )

            let removal = AnyTransition.modifier(
                active: TwistEffect(angle: .degrees(-180)),
                identity: TwistEffect(angle: .degrees(0))
            )

            return .asymmetric(insertion: insertion, removal: removal)
        }
}

struct TwistEffect: GeometryEffect {
    var angle: Angle
    var animatableData: Angle {
        get { angle }
        set { angle = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        let t = CGAffineTransform(rotationAngle: angle.radians)
        return ProjectionTransform(t)
    }
}
