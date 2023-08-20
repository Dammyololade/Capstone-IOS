//
//  RegisterationView.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 19.08.23.
//

import SwiftUI

struct RegisterationView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    
    @State private var successfullyRegisterd = false
    @State private var showError = false
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Logo")
                    .padding(.bottom, 24)
                
                NavigationLink(destination: HomeView(), isActive: $successfullyRegisterd) {
                    EmptyView()
                }
                
                
                
                
                Text("Create an Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(AppColors.black)
                    .padding(.top, 24)
                    .padding(.bottom, 24)
                    .transition(AnyTransition.modifier(active: SlidingDoorEffect(shift: 170), identity: SlidingDoorEffect(shift: 0)))
                
                VStack(alignment: .center) {

                    AppTextField(placeholder: "First name", text: $firstName)
                        .padding(.bottom, 16)
                    
                    AppTextField(placeholder: "Last name", text: $lastName)
                        .padding(.bottom, 16)
                    
                    AppTextField(placeholder: "Email", text: $email)
                        .padding(.bottom, 60)
                    
                    Button(action: {
                        submit()
                    }) {
                        Text("Submit")
                            .font(.headline.weight(.medium))
                            .foregroundColor(.white)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 32)
                            .background(AppColors.primary)
                            .cornerRadius(16)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .center)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
            }
            
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Error"), message: Text("Please fill out all fields"), dismissButton: .default(Text("OK")))
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            UserDefaults.standard.set(true, forKey: AppConstants.kHasBeenOnboarded)
            if UserDefaults.standard.bool(forKey: AppConstants.kIsLoggedIn) {
                successfullyRegisterd = true
            }
        }
    }
}

extension RegisterationView {
    
    func validateFields() -> Bool {
        return !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty
    }
    
    func submit() {
        if validateFields() {
            UserDefaults.standard.setValue(firstName, forKey: AppConstants.keyFirstName)
            UserDefaults.standard.setValue(lastName, forKey: AppConstants.keylastName)
            UserDefaults.standard.setValue(email, forKey: AppConstants.keyEmail)
            UserDefaults.standard.setValue(true, forKey: AppConstants.kIsLoggedIn)
            successfullyRegisterd = true
        } else {
            showError = true
        }
    }
    
}

#Preview {
    RegisterationView()
}
