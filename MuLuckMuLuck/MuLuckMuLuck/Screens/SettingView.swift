//
//  SettingView.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/25.
//

import SwiftUI

struct SettingView: View {
  
  @State var isEditing: Bool = false
  @AppStorage ("name") var name: String = "무럭이"
  
    var body: some View {
      VStack(alignment: .leading){
        
        HStack{
          Text("환경설정")
            .fontWeight(.black)
            .font(.system(size: 40))
          Spacer()
          Button {
            isEditing.toggle()
          } label: {
            Image(systemName: "square.and.pencil")
              .font(.system(size: 30))
          }
        }
        
        Divider()
          .frame(height: 7)
          .overlay(Color.customLightGray)
        HStack{
          Text("이름")
            .padding(.trailing, 100)
          if isEditing{
            TextField("이름을 입력하세요", text: $name)
          } else{
            Text(name)
          }
        }
        
        Divider()
        
        Spacer()
      }.padding(.horizontal)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
