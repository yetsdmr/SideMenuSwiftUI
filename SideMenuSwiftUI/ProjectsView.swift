//
//  ProjectsView.swift
//  SideMenuSwiftUI
//
//  Created by Yunus Emre Taşdemir on 18.04.2023.
//

import SwiftUI

struct ProjectsView: View {
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .leading, endPoint: .trailing)
                .mask(
                    Text("Projects")
                        .bold()
                        .font(.title2)
                    
                )
                .frame(width: 90, height: 90)
                .frame(maxWidth: .infinity, alignment: .leading )
            
            ForEach(arrayProjects) { item in
                HStack {
                    Circle()
                        .fill(item.color)
                        .frame(width: 12, height: 12)
                    Text(item.title)
                        .bold()
                        .font(.title3)
                    Spacer()
                }
                .foregroundColor(.gray)
                .padding(.horizontal, 20)
            }
        }
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
