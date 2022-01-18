//
//  AssignmentList.swift
//  Assignment NoteBook
//
//  Created by Student on 1/14/22.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items = [AssignmentItem(course: "Math", description: "Do page 35", dueDate: Date()),
                            AssignmentItem(course: "Science", description: "Finish lab questions", dueDate: Date()),
                            AssignmentItem(course: "History", description: "Read chapter 5", dueDate: Date())]
 }



