//
//  InfoView.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/25.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
      VStack{
        List{
          Section{
            Text("앱 정보")
              .font(.title)
            
            Text("""
늘어나는 공부량과 수행치에 따라서
무럭이는 자라납니다.

당신의 무럭이를 키워보세요.

당신도 무럭이와 함께 성장해있기를 바랍니다.
""")
            
          }
          
          Section{
            Text("version : 1.0.0")
          }
          
          Section{
            Text("업데이트 예정")
              .font(.title)
            Text("CRUD 추가")
            Text("성장 뷰 통계 추가")
          }
          
        }
      }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
