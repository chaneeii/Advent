//
//  AddPostView.swift
//  AdventCalendar
//
//  Created by Chanhee Jeong on 2022/05/02.
//

import SwiftUI

struct AddPostView: View {
    
    
    // create variables to store post input values
    @State var day: String = ""
    @State var name: String = ""
    @State var content: String = ""
    
    // to go back on home screen when user is added
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
   
    
    var body: some View {
        
        
        VStack{
           
            // create day field
            TextField("Enter day", text: $day)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .disableAutocorrection(true)
            
            // create name field
            TextField("Enter name", text: $name)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .disableAutocorrection(true)
            
            // create content field
            TextField("Enter content", text: $content)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .disableAutocorrection(true)
            
            Button(action: {
                
                // call function to add row in sqlite dabase
                DB_Manager().addPost(dayValue: self.day, nameValue: self.name, contentValue: self.content)
                
                
                // go back to home page
                self.mode.wrappedValue.dismiss()
                
            }, label: {
                
                Text("Add User")
                
            })//
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.top, 10)
            .padding(.bottom, 10)  
        }
        .padding()
        
    }
    
    
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
