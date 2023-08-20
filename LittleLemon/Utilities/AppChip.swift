//
//  AppChip.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 19.08.23.
//

import SwiftUI

struct AppChip: View {
    
    @Binding var selectedChip: String
    let title: String
    
    var isSelected: Bool {
        title == selectedChip
    }
    
    var body: some View {
        Text(title)
            .foregroundColor(isSelected ? .white : AppColors.primary)
            .font(.custom("Georgia", size: 16, relativeTo: .headline))
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(isSelected ? AppColors.primary : AppColors.background)
            .cornerRadius(16)
    }
}

#Preview {
    AppChip(selectedChip: .constant(""), title: "Desserts")
}
