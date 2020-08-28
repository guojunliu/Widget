//
//  SmileEverydaWidget.swift
//  SmileEverydaWidget
//
//  Created by steve on 2020/8/27.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    public typealias Entry = SimpleEntry

    public func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let date = Date()
        let message = "蒹葭苍苍，白露为霜。所谓伊人，在水一方。"
        let backgroundImageStr = "bg7"
        
        
        let entry = SimpleEntry(date: date, message: message, backgroundImageStr: backgroundImageStr)
        completion(entry)
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        var currentDate = Date()
        var nextUpdateDate = Calendar.current.date(byAdding: .second, value: 10, to: currentDate)!
        
        let message = "蒹葭苍苍，白露为霜。所谓伊人，在水一方。\n溯洄从之，道阻且长；溯游从之，宛在水中央。\n蒹葭凄凄，白露未晞。所谓伊人，在水之湄。"
        let backgroundImageStr = "bg"
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var currentDateStr = ""
        var nextUpdateDateStr = ""

        let longUuid = UUID().uuidString
        let range: Range = longUuid.range(of: "-")!
        let location: Int = longUuid.distance(from: longUuid.startIndex, to: range.lowerBound)
        let uuid = longUuid.prefix(location)
        
        for i in 1 ..< 10 {
            
            var msg = ""
            
            currentDate = nextUpdateDate;
            nextUpdateDate = Calendar.current.date(byAdding: .second, value: 10, to: currentDate)!
            
            currentDateStr = formatter.string(from: currentDate)
            nextUpdateDateStr = formatter.string(from: nextUpdateDate)
            
            msg.append(message)
            msg.append("\n时间轴ID " + uuid);
            msg.append("\n时间轴第" + String(i+1) + "个视图")
            msg.append("\n本次视图开始时间 " + currentDateStr)
            msg.append("\n下次视图开始时间 " + nextUpdateDateStr)
            
            let entry = SimpleEntry(date: currentDate, message: msg, backgroundImageStr: backgroundImageStr+String(i))
            
            entries.append(entry)
            print(String(i))
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
    public let message: String
    public let backgroundImageStr : String
}

struct PlaceholderView : View {
    var body: some View {
        Text("PlaceholderView")
            .background(Image("bg1"))
            .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
    }
}

struct SmileEverydaWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        
        let str = "SmileEverydaWidget://" + entry.backgroundImageStr
        return Text(entry.message)
            .widgetURL(URL(string: str))
            .background(Image(entry.backgroundImageStr))
            .font(/*@START_MENU_TOKEN@*/.callout/*@END_MENU_TOKEN@*/)
    }
}

@main
struct SmileEverydaWidget: Widget {
    private let kind: String = "SmileEverydaWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            SmileEverydaWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct SmileEverydaWidget_Previews: PreviewProvider {
    static var previews: some View {
        let date = Date()
        let message = "蒹葭苍苍，白露为霜。所谓伊人，在水一方。\n溯洄从之，道阻且长；溯游从之，宛在水中央。\n蒹葭凄凄，白露未晞。所谓伊人，在水之湄。\n溯洄从之，道阻且跻；溯游从之，宛在水中坻。\n蒹葭采采，白露未已，所谓伊人，在水之涘。\n溯洄从之，道阻且右；溯游从之，宛在水中沚"
        let backgroundImageStr = "bg9"
        
        let entry = SimpleEntry(date: date, message: message, backgroundImageStr: backgroundImageStr)
        return SmileEverydaWidgetEntryView(entry: entry)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
