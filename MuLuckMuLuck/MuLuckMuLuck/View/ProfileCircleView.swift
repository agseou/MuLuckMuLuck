//
//  ProfileCircleView.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/24.
//

import SwiftUI

struct ProfileCircleView: View {
    var body: some View {
      ZStack{
        Circle()
          .fill(Color.blue)
          .frame(width: 150)
        
        Image("mulucki3")
          .resizable()
          .scaledToFit()
          .frame(width: 150)
          .clipShape(Circle())
      } //: ZSTACK
    }
}

struct ProfileCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCircleView()
    }
}
