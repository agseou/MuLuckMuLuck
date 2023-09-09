//
//  CloudAnimationView.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/24.
//

import SwiftUI

struct CloudAnimationView: View {
  // MARK: - PROPERTIES
  
  @State private var randomCircle: Int = Int.random(in: 2...5)
  @State private var isAnimating: Bool = false
  
  // MARK: - FUNCTIONS
  
  // 1. RANDOM COORDINATE
  func randomCoordinate() -> CGFloat{
    return CGFloat.random(in: 10...400)
  }
  
  // 2. RANDOM SIZE
  func randomSize() -> CGFloat{
    return CGFloat(Int.random(in: 40...100))
  }
  
  // 3. RANDOM SCALE
  func randomScale() -> CGFloat {
    return CGFloat(Double.random(in: 0.1...2.0))
  }
  
  // 4. RANDOM SPEED
  func randomSpeed() -> Double{
    return Double.random(in: 0.05...1.0)
  }
  // 5. RANDOM DELAY
  func randomDelay() -> Double{
    return Double.random(in: 0...2)
  }
  
  // MARK: - BODY
    var body: some View {
      ZStack {
        
        ForEach(0...randomCircle, id: \.self) { item in
          Image(systemName: "cloud.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)
            .opacity(0.5)
            .frame(width: randomSize())
            .position(
              x: randomCoordinate(),
              y: randomCoordinate()
            )
            .scaleEffect(isAnimating ? randomScale() : 1)
            .onAppear(perform: {
              withAnimation(
                .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                .repeatForever()
                .speed(randomSpeed())
                .delay(randomDelay())
              ){
                  isAnimating = true
                }
            })
        }
        
      } //: ZSTACK
      
    }
}
// MARK: - PREVIEWS

struct CloudAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CloudAnimationView()
        .preferredColorScheme(.dark)
    }
}
