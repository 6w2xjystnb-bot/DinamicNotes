import WidgetKit
import SwiftUI
import ActivityKit

struct DynamicIslandWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: EventAttributes.self) { context in
            // UI for the Lock Screen (regular notification)
            VStack {
                Text(context.state.eventName)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Text(context.state.targetDate, style: .timer)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.blue)
            }
            .padding()
            .background(Color.black.opacity(0.8))
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded Region
                DynamicIslandExpandedRegion(.leading) {
                    Label {
                        Text("Task")
                    } icon: {
                        Image(systemName: "timer")
                            .foregroundColor(.blue)
                    }
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.state.targetDate, style: .timer)
                        .font(.title2)
                        .bold()
                        .monospacedDigit()
                        .foregroundColor(.blue)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(context.state.eventName)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        ProgressView(value: context.state.progress)
                            .tint(.blue)
                    }
                }
            } compactLeading: {
                // Left side of the pill
                Image(systemName: "timer")
                    .foregroundColor(.blue)
            } compactTrailing: {
                // Right side of the pill
                Text(context.state.targetDate, style: .timer)
                    .font(.caption2)
                    .monospacedDigit()
                    .foregroundColor(.blue)
            } minimal: {
                // When multiple islands are present
                Image(systemName: "timer")
                    .foregroundColor(.blue)
            }
            .keylineTint(.blue)
        }
    }
}
