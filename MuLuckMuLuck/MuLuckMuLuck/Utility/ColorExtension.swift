//
//  ColorExtension.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/20.
//

import Foundation
import SwiftUI

extension Color {
  static let customGreen1 = Color("Green1")
  static let customGreen2 = Color("Green2")
  static let customGreen3 = Color("Green3")
  static let customGreen4 = Color("Green4")
  
  static let customLightGray = Color("LightGray")
  
  static let customSky1 = Color("Sky1")
  static let customSky2 = Color("Sky2")
  static let customSky3 = Color("Sky3")
  static let customSky4 = Color("Sky4")
  static let customSky5 = Color("Sky5")
  static let customSky6 = Color("Sky6")
  
  static let customYellow1 = Color("Yellow1")
  
  static let customMulcukiLeg = LinearGradient(
    colors: [
      Color.green,
      Color.customGreen2],
    startPoint: .top,
    endPoint: .bottom)
  
  static let customSkyMorning = LinearGradient(
    colors: [
      Color.customSky1,
      Color.customSky2,
      Color.customSky3],
    startPoint: .top,
    endPoint: .bottom)
  
  static let customSkyEvening = LinearGradient(
    colors: [
      Color.customSky4,
      Color.customSky5,
      Color.customSky6],
    startPoint: .top,
    endPoint: .bottom)
  
  
}
