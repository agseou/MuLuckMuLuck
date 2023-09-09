//
//  ContentView.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/20.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  
  @State private var backgroundColor = Color.customSkyMorning
  @State private var legLenght: Double = 0
  
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
        
        Group{
          ZStack{
            
            HStack{
              Rectangle()
                .fill(Color.customMulcukiLeg)
                .frame(width: 30, height: 60)
                .cornerRadius(10)
                .padding(10)
              
              Rectangle()
                .fill(Color.customMulcukiLeg)
                .frame(width: 30, height: 60)
                .cornerRadius(10)
                .padding(10)
            }
            .offset(y: 100)
            
            
            Image("muluckiface0")
              .resizable()
              .scaledToFit()
              .frame(width: 200)
            
          }
        }
        .offset(y: 200)
        
      }
      
    }
}
// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
