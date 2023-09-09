//
//  SplashView.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/24.
//

import SwiftUI

struct SplashView: View {
  // MARK: - PROPERTIES
  
  @State private var isActive: Bool = false
  @State private var isAnimating: Bool = false
  @State private var backgroundColor = Color.customSkyMorning
  @AppStorage("isOnboarding") var isOnboarding: Bool = true
  
  // MARK: - FUNCTIONS
  
  private func updateBackgroundColor() {
          let calendar = Calendar.current
          let hour = calendar.component(.hour, from: Date())
          
          if hour >= 6 && hour < 17 { // 오전 6시부터 오후 5시까지
            backgroundColor = Color.customSkyMorning
          } else {
              backgroundColor = Color.customSkyEvening
          }
      }
  
  // MARK: - BODY
    var body: some View {
    
      
      ZStack {
        
        if self.isActive {
          if isOnboarding {
            OnboardingView()
          } else {
            MainView()
          }
        } else {
          
          backgroundColor
            .ignoresSafeArea()
            .overlay {
              CloudAnimationView()
            }

          
          Ellipse()
            .fill(.linearGradient(
              colors: [
                Color.green,
                Color.customGreen3],
              startPoint: .top,
              endPoint: .bottom))
            .frame(width: 700, height: 600)
            .offset(y: 300)
            .shadow(radius: 4)
          
          VStack{
            
            Spacer()
            
            ZStack {
              Ellipse()
                .frame(width: 150, height: 15)
                .opacity(0.3)
                .blur(radius: 2)
                .offset(y: 110)
              
              Image("mulucki3")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .shadow(radius: 2, x: 1 , y: 4)
                .padding()
            } //: ZSTACK
            
            Text("무럭무럭")
              .font(.custom("SeoulNamsanEB", size: 84))
              .fontWeight(.heavy)
              .foregroundColor(.customGreen3)
              .overlay {
                Text("무럭무럭")
                  .font(.custom("SeoulNamsanEB", size: 84))
                  .fontWeight(.heavy)
                  .foregroundColor(.white)
                  .offset(y: -3)
              }
              .shadow(radius: 2)
            
            Spacer()
            
            Text("하루하루 저를 무럭무럭 키워주세요.")
              .fontWeight(.bold)
              .font(.system(size: 20))
              .foregroundColor(.customGreen1)
              .padding(.bottom)
            
          } //: VSTACK
          .opacity(isAnimating ? 1 : 0)
          .offset(y: isAnimating ? 0 : 100)
          .animation(.easeOut(duration: 1), value: isAnimating)
        }
        
      } //: ZSTACK
      .onAppear {
        isAnimating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
          withAnimation {
            self.isActive = true
          }
        }
        
      }
      
      
    }
}
// MARK: - PREVIEWS

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
