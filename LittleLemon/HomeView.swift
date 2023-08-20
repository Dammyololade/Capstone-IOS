//
//  HomeView.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 19.08.23.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentation
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .topTrailing) {
                    Image("Logo")
                        .padding(.bottom, 16)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .center)
                    
                    NavigationLink(destination: UserProfile() {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Image("Profile")
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -12)
                    }
                }
                .padding(.horizontal, 24)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Little Lemon")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(AppColors.accent)
                        .padding(.top, 16)
                        .padding(.bottom, 0)
                        
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Chicago")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.bottom, 24)
                            
                            Text("We are a family owned Meditaerranean restaurant Focused on traditional recipes served with a modern twist")
                                .font(.custom("Georgia", size: 16, relativeTo: .headline))
                                .lineSpacing(2)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Image("HeroImage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130, height: 130)
                            .cornerRadius(16)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .topLeading)
                    
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .topLeading)
                .background(AppColors.primary)
              
                DishListView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension ForEach where Data.Element: Hashable, ID == Data.Element, Content: View {
    init(values: Data, content: @escaping (Data.Element) -> Content) {
        self.init(values, id: \.self, content: content)
    }
}

#Preview {
    HomeView()
}
