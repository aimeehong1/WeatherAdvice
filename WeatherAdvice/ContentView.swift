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
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            Text("Weather Advice")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.teal)
                
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .animation(.default, value: imageName)
            
            Text(adviceMessage)
                .font(.largeTitle)
                .frame(height: 80)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .animation(.default, value: adviceMessage)
            
            Spacer()
            
            HStack {
                Text("What is the temp?")
                    .font(.title)
                
                TextField("", text: $temp)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 65)
                    .onTapGesture {
                        isFocused = true
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 2)
                    }
                    .keyboardType(.numberPad)
            }
            .font(.title)
            
            Button("Get Advice") {
                giveAdvice()
            }
            .buttonStyle(.borderedProminent)
            .tint(.teal)
            .font(.title2)
            
        }
        .padding()
    }
    
    func giveAdvice() {
        guard let temp = Int(temp) else {
            adviceMessage = "Please enter a valid temperature"
            return
        }
        
        switch temp {
        case 76...:
            adviceMessage = "It's Hot"
            imageName = "hot"
        case 63..<76:
            adviceMessage = "Nice and mild"
            imageName = "warm"
        case 45..<63:
            adviceMessage = "You're going to need a sweater"
            imageName = "cool"
        case 33..<45:
            adviceMessage = "You're going to need a coat"
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
