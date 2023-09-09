//
//  OnboardingView.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/24.
//

import SwiftUI

struct OnboardingView: View {
  // MARK: - PROPERTIES
  
  @AppStorage ("isOnboarding") var isOnboarding: Bool = true
  @AppStorage ("name") var name: String = "무럭이"
  @State private var isActive = false
  
  @State private var isAnimating: Bool = false
  @State private var isAnimating2: Bool = false
  @State private var isAnimating3: Bool = false
  
  @State private var tapCount: Int = 0
  let infoText = [
               """
               안녕하세요.
               저는 당신의 무럭이에요.
               """,
                """
                당신과 함께 성장할
                성장메이트예요.
                """,
                 """
                 당신의 무럭이에 대해
                 알려주세요
                 """
  ]
  
  // MARK: - BODY
  var body: some View {
    
    ZStack {
      
      if self.isActive {
        
          MainView()
        
      } else {
      
      Color.customSkyMorning
        .ignoresSafeArea()
      
      // MARK: - 소개
      ZStack {
        VStack(alignment: .center) {
          
          Image("mulucki1")
            .resizable()
            .scaledToFit()
            .frame(width: 150)
            .shadow(radius: 3)
            .padding()
            .animation(.easeOut(duration: 0.4), value: isAnimating)
          
          
          Text(infoText[tapCount])
            .multilineTextAlignment(.center)
            .font(.custom("SeoulNamsanM", size: 24))
            .animation(.linear, value: isAnimating)
        }
        .padding()
        
      }
      .opacity(isAnimating2 ? 0 : 1)
      .onTapGesture {
        if tapCount < 2 {
          tapCount += 1
        } else {
          isAnimating2 = true
        }
      }
      .onAppear {
        isAnimating = true
      }
      
      // MARK: - 이름
      
      VStack(alignment: .center){
        Text("이름을 지어주세요.")
          .font(.title.bold())
          .shadow(radius: 2)
          .padding()
        
        TextField("이름", text: $name)
          .frame(maxWidth: UIScreen.main.bounds.width/2)
          .keyboardType(.default)
          .padding(4)
          .background(.white)
          .border(.blue, width: 2)
          .onSubmit {
            print("이름 입력")
            isAnimating3 = true
          }
      }
      .opacity(isAnimating2 ? 1 : 0)
      
      // MARK: - 애니메이션
      
      ZStack {
        Rectangle()
          .frame(height: 3000)
          .foregroundStyle(.linearGradient(colors: [Color.customSky4, Color.customSky5, Color.customSky6, Color.blue, Color.customSky1, Color.customSky2, Color.customSky3], startPoint: .top, endPoint: .bottom))
          .offset(y: isAnimating3 ? 1000 : -1000)
          .animation(.linear(duration: 2), value: isAnimating3)
        
        Ellipse()
          .fill(.linearGradient(
            colors: [
              Color.green,
              Color.customGreen3],
            startPoint: .top,
            endPoint: .bottom))
          .frame(width: 700, height: 600)
          .offset(y: isAnimating3 ? 800 : 300)
          .shadow(radius: 4)
          .animation(.linear(duration: 1.5), value: isAnimating3)
        
        
        CloudAnimationView()
        
        
        VStack {
          
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
          
          Button {
            self.isActive = true
          } label: {
            Text("Click")
          }

          
        }
          .shadow(radius: 2)
          .opacity(isAnimating3 ? 1 : 0)
          .animation(.easeOut(duration: 1).delay(1.5), value: isAnimating3)
        
        ZStack{
          HStack{
            
            Rectangle()
              .fill(Color.customMulcukiLeg)
              .frame(width: 30, height: 350)
              .cornerRadius(10)
              .padding(10)
            
            Rectangle()
              .fill(Color.customMulcukiLeg)
              .frame(width: 30, height: 350)
              .cornerRadius(10)
              .padding(10)
          }
          .offset(y: 100)
          .shadow(radius: 2)
          
          Image("muluckiface0")
            .resizable()
            .scaledToFit()
            .frame(width: 200)
          
        }
        .offset(y: isAnimating ? 250 : 150)
        .animation(.linear(duration: 1.5), value: isAnimating3)
      }
      .opacity(isAnimating3 ? 1 : 0)
      
    }
      
    }
  }
  // MARK: - PREVIEW
  
  struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
      OnboardingView()
    }
  }
}
