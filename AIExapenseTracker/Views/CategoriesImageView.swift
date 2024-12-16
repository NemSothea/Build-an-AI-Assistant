//
//  FilterCategoriesView.swift
//  AIExapenseTracker
//
//  Created by sothea007 on 10/12/24.
//

import SwiftUI

struct CategoriesImageView: View {
    
   
     let category : Category
    
    var body: some View {
        Image(systemName: category.systemNameIcon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(.all,8)
            .foregroundStyle(category.color)
            .background(category.color.opacity(0.1))
            .cornerRadius(18)
        
    }
}


#Preview {

    return CategoriesImageView(category: .utilities)
}
