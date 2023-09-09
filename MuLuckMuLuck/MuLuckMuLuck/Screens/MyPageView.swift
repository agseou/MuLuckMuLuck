//
//  MyPageView.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/24.
//

import SwiftUI

struct MyPageView: View {
  // MARK: - PROPERTIES
  
  @AppStorage ("name") var name: String = "무럭이"
  @AppStorage("accumulatedTime") var accumulatedTime: TimeInterval = 0
  
  private func formattedTime(_ time: TimeInterval) -> String {
    let Hours = Int(time / 3600)
    let minutes = Int(time / 60)
    let seconds = Int(time) % 60
    
    return String(format: "%02d:%02d:%02d", Hours, minutes, seconds)
  }
  
  
  // MARK: - BODY
    var body: some View {
    
      VStack {
        NavigationStack{
          
        HStack{
          ProfileCircleView()
            .padding(20)
          
          VStack(alignment: .leading, spacing: 15) {
            Text(name)
              .font(.system(size: 40))
            
            Text("누적 시간 : \(formattedTime(accumulatedTime))")
          }
          
          Spacer()
        }
        .navigationTitle("마이페이지")
        .navigationBarTitleDisplayMode(.large)
        
        Divider()
          .frame(height: 7)
          .overlay(Color.customLightGray)
      
          // MARK: - 1. NAVIGATION : SETTING
          
          NavigationLink {
            SettingView()
            Spacer()
          } label: {
            MyPageRowView(rowIcon: "gearshape.fill", rowLabel: "환경설정")
          }
          Divider()
          
          // MARK: - 2. NAVIGATION : INFO
          NavigationLink {
            InfoView()
          } label: {
            MyPageRowView(rowIcon: "info.square.fill", rowLabel: "정보")
          }

          
          Divider()
        
        Spacer()
        }
        
      }
      
    }
}

// MARK: - PREVIEWS

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
