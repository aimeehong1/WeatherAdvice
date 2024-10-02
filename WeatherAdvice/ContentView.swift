//
//  ContentView.swift
//  WeatherAdvice
//
//  Created by Aimee Hong on 9/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var imageName = ""
    @State private var adviceMessage = ""
    @State private var temp = ""
    @FocusState private var textFieldIsFocused: Bool
    
    var body: some View {
        VStack {
            Text("Weather Advice")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.teal)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .animation(.default, value: imageName)
            
            Spacer()
            
            Text(adviceMessage)
                .font(.largeTitle)
                .frame(height: 80)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .animation(.default, value: imageName)
            
            Spacer()
            
            HStack {
                Text("What is the temp?")
                
                TextField("", text: $temp)
                    .focused($textFieldIsFocused)
                    .frame(width: 65)
                    .textFieldStyle(.roundedBorder)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 2)
                    }
                    .keyboardType(.numberPad)
                    .onChange(of: textFieldIsFocused) {
                        if textFieldIsFocused {
                            adviceMessage = ""
                            imageName = ""
                            temp = ""
                        }
                    }
            }
            .font(.title)
            
            Button("Get Advice") {
                giveAdvice()
                textFieldIsFocused = false
            }
            .buttonStyle(.borderedProminent)
            .tint(.teal)
            .font(.title2)
            .disabled(temp.isEmpty)
        }
    }
    
    func giveAdvice() {
        guard let tempInt = Int(temp) else {
            adviceMessage = "Please enter a valid temperature"
            return
        }
        
        switch tempInt {
        case 76...:
            adviceMessage = "It's Hot!"
            imageName = "hot"
        case 63..<76:
            adviceMessage = "Nice and mild!"
            imageName = "warm"
        case 45..<63:
            adviceMessage = "You're going to need a sweater!"
            imageName = "cool"
        case 33..<45:
            adviceMessage = "You're going to need a coat!"
            imageName = "cold"
        default:
            adviceMessage = "Bundle up, it's freezing!"
            imageName = "freezing"
        }
    }
}

#Preview {
    ContentView()
}
