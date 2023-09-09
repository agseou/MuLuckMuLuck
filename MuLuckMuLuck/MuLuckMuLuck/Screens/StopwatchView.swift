//
//  StopwatchView.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/24.
//

import SwiftUI

struct StopwatchView: View {
  // MARK: - PROPERTIES
  
  @State var isRunning: Bool = false
  @State private var shouldShowText = false
  @State private var elapsedTime: TimeInterval = 0
  @State private var warningTime: Int = 10
  @State private var elapsedTimer: Timer?
  @State private var accumulatedTimer: Timer?
  @AppStorage("accumulatedTime") var accumulatedTime: TimeInterval = 0
  @State private var backgroundColor = Color.customSkyMorning
  
  // MARK: - METHOD

  // 시간을 시:분:초 형식으로 포맷하는 메서드
  private func formattedTime(_ time: TimeInterval) -> String {
    let Hours = Int(time / 3600)
    let minutes = Int(time / 60)
    let seconds = Int(time) % 60
    
    return String(format: "%02d:%02d:%02d", Hours, minutes, seconds)
  }
  
  // MARK: - BODY
    var body: some View {
      ZStack {
        
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
          .offset(y: 500)
          .shadow(radius: 4)
        
        VStack{
          
          Group {
            
            // MARK: - ACCUMULATED TIMELABLE
            VStack{
              Text("누적시간")
              Text("\(formattedTime(accumulatedTime))")
            }
            .fontWeight(.light)
            .padding(.top)
            
            // MARK: - ELAPESD TIMELABLE
            
            Text("\(formattedTime(elapsedTime))")
              .font(.system(size: 64))
            
            // MARK: - WARNING TIMELABLE
            if shouldShowText {
              if warningTime < 0 {
                Text("시간 경과!")
                  .fontWeight(.light)
                  .foregroundColor(.red)
                  .font(.system(size: 15))
              }
              else {
                Text(" \((Int)(warningTime))초 안에 재시작하면 시간이 이어집니다.")
                  .fontWeight(.light)
                  .font(.system(size: 15))
              }
            }
            
          }
          
          Spacer()
          
          // MARK: - TIMER BUTTON
          Button {
            if isRunning {
              //스톱워치 중지
              isRunning = false
              shouldShowText = true
              
              elapsedTimer?.invalidate()
              elapsedTimer = nil
              
              accumulatedTimer?.invalidate()
              accumulatedTimer = nil
              
              //재시작 타이머 카운트다운
              elapsedTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { elapsedTimer in
                if warningTime >= 0{
                  warningTime -= 1
                }
              }
       
               
            } else {
              //스톱워치 시작
              isRunning = true
              shouldShowText = false
              if warningTime < 0 {
                elapsedTime = 0
              }
              warningTime = 10
              
              elapsedTimer?.invalidate()
              elapsedTimer = nil
              
              elapsedTimer = Timer.scheduledTimer(
                withTimeInterval: 1,
                repeats: true) { elapsedTimer in
                  elapsedTime += 1
                }
              
               accumulatedTimer = Timer.scheduledTimer(
                withTimeInterval: 1,
                repeats: true) { accumulatedTimer in
                  accumulatedTime += 1
                }
            }
          } label: {
            StopwatchButtonView(isRunning: isRunning)
          } //: BUTTON
          
          Spacer()
          
          // MARK: - MULUCKI
          Image("mulucki3")
            .resizable()
            .scaledToFit()
            .frame(width: 150)
            .padding()
          
          
          
        } //: VSTACK
      } //: ZSTACK
    }
}
// MARK: - PREVIEWS

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
