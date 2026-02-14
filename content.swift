import SwiftUI

// This is the main logic of your learning tracker
struct SwiftLearningMVP: View {
    @State private var daysCompleted: [Bool] = [false, false, false, false, false, false, false]
    @State private var currentTask: String = "Introduction to Variables"
    
    var body: some View {
        VStack {
            Spacer()
            
            // Task Section
            VStack(spacing: 20) {
                Text("Day \(currentDayIndex + 1)")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text(currentTask)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Button(action: {
                    completeTask()
                }) {
                    Text(daysCompleted[currentDayIndex] ? "Task Completed!" : "Mark Task as Done")
                        .fontWeight(.semibold)
                        .frame(width: 240, height: 50)
                        .background(daysCompleted[currentDayIndex] ? Color.green : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding()
            
            Spacer()
            
            // Weekly Progress Tracker (The 7 Circles)
            VStack(spacing: 12) {
                Text("Weekly Progress")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                
                HStack(spacing: 12) {
                    ForEach(0..<7) { index in
                        Circle()
                            .strokeBorder(Color.blue, lineWidth: 2)
                            .background(Circle().foregroundColor(daysCompleted[index] ? .blue : .clear))
                            .frame(width: 30, height: 30)
                    }
                }
            }
            .padding(.bottom, 50)
        }
    }
    
    // Logic to find which day we are on
    var currentDayIndex: Int {
        daysCompleted.firstIndex(of: false) ?? 6
    }
    
    // Logic to mark a day as finished
    func completeTask() {
        if let index = daysCompleted.firstIndex(of: false) {
            daysCompleted[index] = true
        }
    }
}

// THIS SECTION IS NEW: It tells Playgrounds what to show first
struct ContentView: View {
    var body: some View {
        SwiftLearningMVP()
    }
}
