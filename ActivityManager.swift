import Foundation
import ActivityKit

class ActivityManager {
    static let shared = ActivityManager()
    
    @Published var currentActivity: Activity<EventAttributes>?
    
    func startActivity(name: String, durationInSeconds: Double) {
        // Check if Live Activities are enabled
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("Live Activities are not enabled.")
            return
        }
        
        let targetDate = Date().addingTimeInterval(durationInSeconds)
        let attributes = EventAttributes()
        let state = EventAttributes.ContentState(
            eventName: name,
            targetDate: targetDate,
            progress: 0.0
        )
        
        do {
            let activity = try Activity.request(
                attributes: attributes,
                content: .init(state: state, staleDate: nil)
            )
            DispatchQueue.main.async {
                self.currentActivity = activity
            }
            print("Started Activity: \(activity.id)")
        } catch {
            print("Error starting activity: \(error.localizedDescription)")
        }
    }
    
    func endActivity() {
        Task {
            for activity in Activity<EventAttributes>.activities {
                await activity.end(dismissalPolicy: .immediate)
            }
            DispatchQueue.main.async {
                self.currentActivity = nil
            }
        }
    }
}
