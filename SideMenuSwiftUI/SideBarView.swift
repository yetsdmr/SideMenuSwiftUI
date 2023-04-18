//
//  SideBarView.swift
//  SideMenuSwiftUI
//
//  Created by Yunus Emre Taşdemir on 18.04.2023.
//

import SwiftUI

struct SideBarView: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        VStack {
            Spacer()
            userAndDB()
                .padding()
            TabItemAndAnimation()
            ProjectsView()
            Spacer()
            DarkToggle(vm: _vm)
            Spacer()
        }
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(.black)
        .mask(RoundedRectangle(cornerRadius: 38, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func userAndDB() -> some View {
        HStack {
            Image("emre")
                .resizable()
                .scaledToFill()
                .mask(Circle())
                .frame(width: 60, height: 60)
            
            VStack {
                Text("name")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white )
                Text("@name")
                    .bold()
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button {
                withAnimation(.easeIn) {
                    vm.isOpen.toggle()
                    vm.sideButton.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.white)
            }

        }
    }
    
    @ViewBuilder
    func TabItemAndAnimation() -> some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: 1)
                .opacity(0.2)
                .foregroundColor(.white)
                .padding(.horizontal)
            ForEach(sidebar) { item in
                Button {
                    withAnimation {
                        vm.selectedItem = item.tab
                    }
                } label: {
                    HStack(spacing: 14) {
                        Image(systemName: item.icon)
                        Text(item.title)
                            .font(.title3)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .foregroundStyle(vm.selectedItem == item.tab ? .white : .gray)
            }
        } 
        .frame(width: 300, height: 240)
        .overlay(content: {
            VStack {
                if vm.selectedItem == .maginf {Spacer()}
                if vm.selectedItem == .rect {Spacer()}
                if vm.selectedItem == .bell {
                    Spacer()
                    Spacer()
                }
                Rectangle()
                    .frame(width: 3, height: 25)
                    .foregroundStyle(.green)
                    .cornerRadius(2)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 5)
                if vm.selectedItem == .home {Spacer()}
                if vm.selectedItem == .maginf {
                    Spacer()
                    Spacer()
                }
                if vm.selectedItem == .bell {Spacer()}
            }
            .frame(height: 210)
            .frame(maxWidth: .infinity, alignment: .leading)
        })
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
            .environmentObject(ViewModel())
    }
}

struct DarkToggle: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        HStack {
            Image(systemName: "gearshape")
            Text("Dark Mode")
            Spacer()
            Toggle(isOn: $vm.toogleAction, label: {
                
            })
            .frame(width: 50, height: 50)
        }
        .padding()
        .foregroundColor(.white)
    }
}
