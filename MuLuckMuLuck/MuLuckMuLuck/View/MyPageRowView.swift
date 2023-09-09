//
//  MyPageRowView.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/25.
//

import SwiftUI

struct MyPageRowView: View {
  
  @State var rowIcon: String
  @State var rowLabel: String
  
  var body: some View {
    Group {
      HStack{
        Image(systemName: rowIcon)
          .resizable()
          .scaledToFit()
          .frame(width: 30)
          .padding()
          .foregroundColor(.black)
        
        Text(rowLabel)
          .font(.system(size: 30))
          .padding()
          .foregroundColor(.black)
        
        Spacer()
        
        Image(systemName: "chevron.forward")
          .resizable()
          .scaledToFit()
          .frame(width: 10)
          .foregroundColor(.gray)
          .padding()
      }
    }
  }
}

struct MyPageRowView_Previews: PreviewProvider {
    static var previews: some View {
      MyPageRowView(rowIcon: "gearshape.fill", rowLabel: "환경설정")
    }
}
