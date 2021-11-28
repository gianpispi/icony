//
//  ContentView.swift
//  Icony
//
//  Created by Gianpiero Spinelli on 28/11/21.
//

import SwiftUI

struct ErrorDescription: Identifiable {
    let id: UUID = UUID()
    let description: String
}

struct ContentView: View {
    @ObservedObject
    var viewModel = IconViewModel()
    
    @State var error: ErrorDescription? = nil
    
    var body: some View {
        List(viewModel.appIcons, id: \.self) { item in
            Button {
                changeIcon(for: item)
            } label: {
                HStack {
                    Image(item.icon.thumbnail)
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text(verbatim: item.icon.name)
                    Spacer()
                    if item.isSelected {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
        .alert(item: $error) { error in
            Alert(title: Text("Error"), message: Text(error.description), dismissButton: .default(Text("Noooo :(")))
        }
    }
    
    private func changeIcon(for iconStatus: IconWithStatus) {
        UIApplication.shared.setAlternateIconName(iconStatus.icon.iconName) { error in
            if let error = error {
                self.error = ErrorDescription(description: error.localizedDescription)
            } else {
                viewModel.refreshIcons()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
