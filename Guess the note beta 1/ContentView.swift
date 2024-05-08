//
//  ContentView.swift
//  Guess the note prueba
//
//  Created by Mundo Martinez on 4/27/23.
//
import SwiftUI
struct ContentView: View {
    
    @State private var isActive = false
    @State private var isActive2 = false
    @State private var isActive3 = false
    
    var body: some View {
        NavigationView{
        ZStack{
            Color.green
                .ignoresSafeArea()
            Circle()
                .scale(1.9)
                .foregroundColor(Color.black.opacity(0.5))
                .position(x: 200, y: 500)
            Text("Developed by Edmundo G. Martinez")
                .font(.subheadline)
                .foregroundColor(.green)
                .position(x: 210, y: 735)
            
            
            VStack{
                Text("Guess the note")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .position(x: 210, y: 50)
                VStack{
                    Text("Choose level")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.green)
                        .position(x: 210, y: -200)
                    Text("Levels")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .frame(width:340, height:50)
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(10)
                        .position(x: 210, y: -150)
                    
            
                    NavigationLink(
                        destination: LevelThree(),
                        isActive: $isActive3,
                        label: {
                            Button("Level 1") {
                                isActive3 = true
                            }
                        }
                        )
                            .foregroundColor(.white)
                            .frame(width:340,height:50)
                            .background(Color.green)
                            .cornerRadius(10)
                            .position(x: 210, y: -150)
                    
                    NavigationLink(
                        destination: LevelTwo(),
                        isActive: $isActive2,
                        label: {
                            Button("Level 2") {
                                isActive2 = true
                            }
                        }
                        )
                    .foregroundColor(.white)
                    .frame(width:340,height:50)
                    .background(Color.purple)
                    .cornerRadius(10)
                    .position(x: 210, y: -150)
                    
                    NavigationLink(
                        destination: LevelOne(),
                        isActive: $isActive,
                        label: {
                    
                    Button("Level 3"){
                        isActive = true
                        
                    }
                }
                )
                    .foregroundColor(.white)
                    .frame(width:340,height:50)
                    .background(Color.red)
                    .cornerRadius(10)
                    .position(x: 210, y: -150)
                }
            }
        }
    }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

