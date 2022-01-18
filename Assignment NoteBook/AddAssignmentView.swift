//
//  AddAssignmentView.swift
//  Assignment NoteBook
//
//  Created by Student on 1/18/22.
//

import SwiftUI
 
struct AddAssignmentView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let courses = ["Math", "Science", "History"]
    var body: some View {
        NavigationView {
            Form {
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                Picker("Courses", selection: $course) {
                    ForEach(Self.courses, id: \.self) {
                        course in
                        Text(course)
                    }
                }
            }
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
        }
    }
}
 
struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}
 
 
 
