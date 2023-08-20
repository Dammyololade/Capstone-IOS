//
//  AppTextField.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 19.08.23.
//

import SwiftUI

struct AppTextField: View {
    
    let placeholder: String
    @State var isEditing = false
    @Binding var text: String
    
    
    
    var border: some View {
        RoundedRectangle(cornerRadius: 16)
          .strokeBorder(
            LinearGradient(
              gradient: .init(
                colors: [
                    AppColors.black,
                    AppColors.accent
                ]
              ),
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            ),
            lineWidth: isEditing ? 2 : 1
          )
      }
    
   
    
    
    var body: some View {
        TextField(placeholder, text: $text, onEditingChanged: { isEditing = $0})
            .textFieldStyle(PlainTextFieldStyle())
                  .multilineTextAlignment(.leading)
                  .font(.headline.weight(.regular))
                  .padding(.vertical, 12)
                  .padding(.horizontal, 16)
                  .background(border)
    }
}

#Preview {
    AppTextField(placeholder: "Email", text: .constant("Email"))
}
