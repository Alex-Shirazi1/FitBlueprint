//
//  WorkoutListView.swift
//  FitBlueprintWatch Watch App
//
//  Created by Alex Shirazi on 12/20/23.
//

import Foundation
import SwiftUI

struct WorkoutListView: View {
    var body: some View {
        List {
            Text("Running")
            Text("Walking")
            Text("Workout Test")
        }
        .navigationTitle("Workouts")
    }
}

// Preview for WorkoutListView
struct WorkoutListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListView()
    }
}
