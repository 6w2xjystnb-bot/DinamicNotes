import SwiftUI

struct ContentView: View {
    @State private var eventName: String = ""
    @State private var minutes: String = "5"
    @State private var isActivityRunning = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 8) {
                    Image(systemName: "island.inset.filled")
                        .font(.system(size: 60))
                        .foregroundStyle(.blue)
                    
                    Text("Dynamic Notes")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                }
                .padding(.top, 40)
                
                // Form
                VStack(spacing: 20) {
                    TextField("Event Name", text: $eventName)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                        .foregroundStyle(.white)
                    
                    TextField("Minutes from now", text: $minutes)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                        .foregroundStyle(.white)
                        .keyboardType(.numberPad)
                }
                .padding(.horizontal)
                
                // Action Button
                Button(action: {
                    if isActivityRunning {
                        ActivityManager.shared.endActivity()
                        isActivityRunning = false
                    } else {
                        let duration = (Double(minutes) ?? 5) * 60
                        ActivityManager.shared.startActivity(name: eventName, durationInSeconds: duration)
                        isActivityRunning = true
                        
                        // Clear inputs
                        eventName = ""
                    }
                }) {
                    Text(isActivityRunning ? "Stop Live Activity" : "Launch to Island")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isActivityRunning ? Color.red : Color.blue)
                        .cornerRadius(15)
                        .shadow(color: (isActivityRunning ? Color.red : Color.blue).opacity(0.5), radius: 10, x: 0, y: 5)
                }
                .padding(.horizontal)
                
                Spacer()
                
                Text("Swipe up to minimize and see the magic.")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 20)
            }
        }
    }
}
