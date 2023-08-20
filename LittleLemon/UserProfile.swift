//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 18.08.23.
//

import SwiftUI

struct UserProfile: View {
    
    @State var firstName = UserDefaults.standard.string(forKey: AppConstants.keyFirstName) ?? ""
    @State var lastName = UserDefaults.standard.string(forKey: AppConstants.keylastName) ?? ""
    @State var email = UserDefaults.standard.string(forKey: AppConstants.keyEmail) ?? ""
    @State var mobile = UserDefaults.standard.string(forKey: AppConstants.kPhoneNumber) ?? ""
    @State var showError = false
    var logoutHandler: () -> Void
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    Image("Profile")
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .padding(.bottom, 24)
                    
                    Text("First name")
                        .font(.headline)
                        .fontWeight(.regular)
                        .padding(.bottom, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    AppTextField(placeholder: "", text: $firstName)
                        .padding(.bottom, 20)
                    
                    Text("Last name")
                        .font(.headline)
                        .fontWeight(.regular)
                        .padding(.bottom, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    AppTextField(placeholder: "", text: $lastName)
                        .padding(.bottom, 20)
                    
                    Text("Email")
                        .font(.headline)
                        .fontWeight(.regular)
                        .padding(.bottom, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    AppTextField(placeholder: "", text: $email)
                        .padding(.bottom, 20)
                    
                    Text("Phone number")
                        .font(.headline)
                        .fontWeight(.regular)
                        .padding(.bottom, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    AppTextField(placeholder: "", text: $mobile)
                        .padding(.bottom, 40)
                    
                    VStack {
                        Button(action: {
                            
                        }) {
                            Text("Save changes")
                                .font(.headline.weight(.medium))
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 32)
                                .frame(maxWidth: .infinity)
                                .background(AppColors.primary)
                                .cornerRadius(16)
                        }
                        .padding(.bottom, 40)
                    
                        Button(action: {
                            UserDefaults.standard.set(false, forKey: AppConstants.kIsLoggedIn)
                            self.presentation.wrappedValue.dismiss()
                            logoutHandler()
                        }) {
                            Text("Log out")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(AppColors.secondary1)
                        }
                    }
                    
                    
                }
                .padding(.horizontal, 20)
            }
            .alert(isPresented: $showError) {
                Alert(title: Text("Error"), message: Text("Please fill out all fields"), dismissButton: .default(Text("OK")))
            }
            .navigationTitle("Personal Information")
        }
    }
}

extension UserProfile {
    
    func validateFields() -> Bool {
        return !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty
    }
    
    func submit() {
        if validateFields() {
            UserDefaults.standard.setValue(firstName, forKey: AppConstants.keyFirstName)
            UserDefaults.standard.setValue(lastName, forKey: AppConstants.keylastName)
            UserDefaults.standard.setValue(email, forKey: AppConstants.keyEmail)
            UserDefaults.standard.setValue(mobile, forKey: AppConstants.kPhoneNumber)
        } else {
            showError = true
        }
    }
    
    func logout() {
        
    }
    
}

#Preview {
    UserProfile() {
        
    }
}
