//
//  ContentView.swift
//  FitBlueprintWatch Watch App
//
//  Created by Alex Shirazi on 12/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "figure.walk")
                    .imageScale(.large)
                    .foregroundColor(.blue)
                Text("Welcome to FitBlueprint!")
                    .font(.headline)
                Text("Get Started")
                    .font(.subheadline)
                NavigationLink(destination: WorkoutListView()) {
                    Text("Start a Workout")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
        }
    }
}


