import ActivityKit
import Foundation

struct EventAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic data that can change over time
        var eventName: String
        var targetDate: Date
        var progress: Double // 0.0 to 1.0
    }

    // Static data that is set when the activity starts
    var id = UUID()
}
