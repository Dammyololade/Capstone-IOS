//
//  OnboardingMain.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 19.08.23.
//

import SwiftUI

struct OnboardingMain: View {
    let pages = [
        IntroView(image: "IntroOne", title: "The Ultimate Restuarant Service", description: "This is a simple app to help you Order your favourite food from Little Lemon. Food is any substance consumed to provide nutritonal support."),
        
        IntroView(image: "IntroTwo", title: "Order your Favourite Meal Anytime", description: "This is a simple app to help you Order your favourite food from Little Lemon. Food is any substance consumed to provide nutritonal support."),
        
        IntroView(image: "IntroThree", title: "AI Tracking Inclusive", description: "This is a simple app to help you Order your favourite food from Little Lemon. Food is any substance consumed to provide nutritonal support."),
    ]
    
    @State private var currentpage = 0
    
    var body: some View {
        NavigationView {
            VStack {
                
                GeometryReader { geometry in
                    PagingScrollView(activePageIndex: $currentpage,
                                     tileWidth: geometry.size.width,
                                     tilePadding: 0) {
                        ForEach (0 ..< 3) { index in
                            pages[index]
                                .transition(AnyTransition.pageTransition)
                                .id(self.currentpage)
                        }
                       }
                }
                .edgesIgnoringSafeArea(.all)
                
                Spacer()
                
                HStack {
                    NavigationLink(destination: RegisterationView()) {
                        Text("Skip")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    if currentpage == 2 {
                        NavigationLink(destination: RegisterationView()) {
                            Text("Get Started")
                                .font(.headline)
                                .foregroundColor(AppColors.primary)
                        }
                    } else {
                        Button(action: {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                self.currentpage = (self.currentpage + 1) % self.pages.count
                            }
                        }) {
                            Text("Next")
                                .font(.headline)
                                .foregroundColor(AppColors.primary)
                            Image(systemName: "chevron.right")
                                .imageScale(.large)
                                .foregroundColor(AppColors.primary)
                        }
                    }
                    
                }
                .padding(.horizontal, 24)
            }
            
        }
        
    }
}

#Preview {
    OnboardingMain()
}
