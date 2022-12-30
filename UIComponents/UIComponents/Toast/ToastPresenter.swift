//
//  ToastPresenter.swift
//  UIComponents
//
//  Created by Celik, Salih on 30.12.2022.
//

import SwiftEntryKit

public class ToastPresenter {
    
    public static func showWarningToast(text: String) {
        var attributes = EKAttributes.topToast
        attributes.entryBackground = .color(color: EKColor(light: .appRed, dark: .appRed))
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation

        let customView = ToastWarningView(text: text)
        SwiftEntryKit.display(entry: customView, using: attributes)
    }
}
