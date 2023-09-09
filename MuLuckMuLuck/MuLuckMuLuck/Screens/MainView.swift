//
//  MainView.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/20.
//

import SwiftUI

struct MainView: View {
  // MARK: - PROPERTIES
  
  @State private var selection = 2
  
  // MARK: - BODY
    var body: some View {
      TabView(selection: $selection) {
        
        CalendarView()
          .tabItem {
            Image(systemName: "calendar")
            Text("캘린더")
          }
          .tag(0)
        
        StopwatchView()
          .tabItem {
            Image(systemName: "stopwatch")
            Text("타이머")
          }
          .tag(1)
        
        ContentView()
          .tabItem {
            Image(systemName: "heart.fill")
            Text("나의 성장")
          }
          .tag(2)
        
        MyPageView()
          .tabItem {
            Image(systemName: "person.fill")
            Text("마이페이지")
          }
          .tag(3)
                        
      } //: TABVIEW
      .tabViewStyle(.automatic)
      
    }
}
// MARK: - PREVIEW

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
