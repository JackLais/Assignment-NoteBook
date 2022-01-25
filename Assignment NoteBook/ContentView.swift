//
//  ContentView.swift
//  Assignment NoteBook
//
//  Created by Student on 1/14/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    init () {
        UITableView.appearance().backgroundColor = .blue
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.items) {item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                    
                    .listRowBackground(Color.orange)
                    
                }
                .onMove(perform: { indices, newOffset in
                    assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentList.items.remove(atOffsets: indexSet)
                })
            }
            .sheet(isPresented: $showingAddAssignmentView, content: {
                AddAssignmentView(assignmentList: assignmentList)
            })
            .navigationBarTitle("Courses", displayMode: .inline)
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: { showingAddAssignmentView = true}) {
                                    Image(systemName: "plus")
                                })
        }
    }
    func highlight(_: AssignmentList) {
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
  
}

