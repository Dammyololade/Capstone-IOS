//
//  IntroView.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 19.08.23.
//

import SwiftUI

struct IntroView: View {
    var image: String
    var title: String
    var description: String
    
    
    var body: some View {
        ZStack {
            AppColors.background
                .edgesIgnoringSafeArea(.all)
                
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(1.6, contentMode: .fill)
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                            minHeight: 0,
                           maxHeight: .infinity
                    )
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 50, height: 10)))
                    .edgesIgnoringSafeArea(.top)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -12)

                
                VStack {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(AppColors.black)
                        .padding(.top, 24)
                        .transition(AnyTransition.modifier(active: SlidingDoorEffect(shift: 170), identity: SlidingDoorEffect(shift: 0)))
                    
                    //Spacer()
                    Text(description)
                        .multilineTextAlignment(.center)
                        .lineSpacing(3)
                        .foregroundColor(.gray)
                        .font(.custom("Georgia ", size: 16, relativeTo: .headline))
                        .padding(.vertical, 16)
                    
                }
                .padding(.horizontal, 24)
                
            }
            
        
        }
    }
}

#Preview {
    IntroView(image: "IntroTwo", title: "Just a neat title", description: "This is a simple app to help you Order your favourite food from Little Lemon. Food is any substance consumed to provide nutritonal support.")
}
