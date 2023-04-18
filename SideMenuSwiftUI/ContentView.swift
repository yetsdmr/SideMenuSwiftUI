//
//  ContentView.swift
//  SideMenuSwiftUI
//
//  Created by Yunus Emre Taşdemir on 18.04.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            SideBarView()
                .opacity(vm.isOpen ? 1 : 0)
            ZStack {
                Color(.white)
                VStack {
                    SideBarButton()
                    HomeView()
                }
                .padding()
                .padding(.vertical, 50)
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .rotation3DEffect(.degrees(30), axis: (x: 0, y: vm.isOpen ? -1 : 0 , z: 0))
            .offset(x: vm.isOpen ? 250 : 0)
            .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func SideBarButton() -> some View {
        if vm.sideButton {
            Button {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                    vm.isOpen.toggle()
                    vm.sideButton.toggle()
                }
            } label: {
                Image(systemName: "line.3.horizontal")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

        }
    }
    
    @ViewBuilder
    func HomeView() -> some View {
        ForEach(arrayColor) { item in
            VStack {
                HStack {
                     RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(item.acolors)
                        .frame(width: 150, height: 200)
                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                       .foregroundColor(item.acolors)
                       .frame(width: 150, height: 200)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
