//
//  WidgetManager.swift
//  SmileEveryday
//
//  Created by steve on 2020/8/27.
//

import Foundation
import WidgetKit

class WidgetManager : NSObject {
    @objc class public func reloadTimelines() {
        WidgetCenter.shared.reloadTimelines(ofKind: "SmileEverydaWidget")
    }
}


