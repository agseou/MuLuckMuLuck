//
//  CalendarView.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/24.
//

import SwiftUI

struct CalendarView: View {
  // MARK: - PROPERTIES
  
  @State var currentDate: Date = Date()
  @State private var backgroundColor = Color.customSkyMorning
  
  // MARK: - FUNTIONS
  
  // MARK: - BODY
    var body: some View {
      ZStack{
        
        backgroundColor
          .ignoresSafeArea()
        
        ScrollView(.vertical, showsIndicators: false){
          VStack(spacing: 20){
            
            CustomDatePicker(currentDate: $currentDate)
            
          }
          .padding(.vertical)
        }
        
          
      } //: ZSTACK
    }
}

// MARK: - PREVIEWS

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
      CalendarView()
    }
}
