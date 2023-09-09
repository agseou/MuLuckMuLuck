//
//  StopwatchButtonView.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/25.
//

import SwiftUI

struct StopwatchButtonView: View {
  
  var isRunning: Bool
  
    var body: some View {
      
      Image(systemName: isRunning ?  "cloud.drizzle.fill": "cloud.fill")
        .resizable()
        .scaledToFit()
        .foregroundStyle(LinearGradient(
              colors: [
                .white,
                .customSky3],
              startPoint: .top,
              endPoint: .bottom))
        .frame(width: 250)
        .shadow(radius: 3)
    }
}

struct StopwatchButtonView_Previews: PreviewProvider {
    static var previews: some View {
      StopwatchButtonView(isRunning: true)
    }
}
