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
    static let courses = ["Math", "Science", "History", "English", "Spanish", "Mobile Apps Development", "Graphic Design"]
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
                ColorPicker("Pick a Color", selection: $highlight)
            }
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if course.count > 0 && description.count > 0 {
                    let item = AssignmentItem(id: UUID(), course: course, description: description, dueDate: dueDate)
                    assignmentList.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}
 
struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}
 
 
 
