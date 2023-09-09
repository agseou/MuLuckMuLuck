//
//  Task.swift
//  MuLuckMuLuck
//
//  Created by 은서우 on 2023/08/25.
//

import SwiftUI

struct Task: Identifiable {
  var id = UUID()
  var title: String
  var time: Date = Date()
}

struct TaskMetaData: Identifiable{
  var id = UUID().uuidString
  var task: [Task]
  var taskDate: Date
}

func getSampleDate(offset: Int)->Date{
  let calender = Calendar.current
  
  let date = calender.date(byAdding: .day, value: offset ,to: Date())
  
  return date ?? Date()
}

var tasks: [TaskMetaData] = [

  TaskMetaData(task: [Task(title: "디자인 뽑기"),
                      Task(title: "Coredata 연구"),
                      Task(title: "숨쉬기")
                     ], taskDate: getSampleDate(offset: 1)),
  TaskMetaData(task: [Task(title: "에구구 언제 다해ㅠ")],
               taskDate: getSampleDate(offset: -3)),
  TaskMetaData(task: [Task(title: "소금빵 사기")],
               taskDate: getSampleDate(offset: -8)),
  TaskMetaData(task: [Task(title: "무럭이 물주기")],
               taskDate: getSampleDate(offset: 10)),
  TaskMetaData(task: [Task(title: "여행떠나기")],
               taskDate: getSampleDate(offset: -22)),
  TaskMetaData(task: [Task(title: "햄깅 쓰다듬기")],
               taskDate: getSampleDate(offset: 15)),
  TaskMetaData(task: [Task(title: "발표하기")],
               taskDate: getSampleDate(offset: -20))
  
  
]
