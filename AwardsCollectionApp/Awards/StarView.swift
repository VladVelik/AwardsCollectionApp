//
//  StarView.swift
//  AwardsCollectionApp
//
//  Created by Sosin Vladislav on 01.03.2023.
//

import SwiftUI

struct StarView: View {
    var body: some View {
        GeometryReader { geometry in
            let gradientWithFourColors = Gradient(colors: [
                Color.blue,
                Color.pink,
                Color.yellow,
                Color.green
                ]
            )

            let width = geometry.size.width
            let height = geometry.size.height
            
            Circle()
                .foregroundColor(.blue)
            Image(systemName: "star.fill")
                .resizable()
                .foregroundColor(.red)
                .offset(y: -7.5)
            Circle()
                .fill(
                    RadialGradient(
                        gradient: gradientWithFourColors,
                        center: .center,
                        startRadius: 0,
                        endRadius: 150)
                )
                .scaleEffect(0.4)
        }
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView()
            .frame(width: 200, height: 200)
    }
}
