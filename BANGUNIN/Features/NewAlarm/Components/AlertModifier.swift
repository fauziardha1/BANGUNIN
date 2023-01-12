//
//  AlertModifier.swift
//  BANGUNIN
//
//  Created by FauziArda on 12/01/23.
//

import SwiftUI

struct BanguninAlertModifier {

    // MARK: - Value
    // MARK: Private
    @Binding private var isPresented: Bool

    // MARK: Private
    private let title: String
    private let message: String
    private let alertStatus : AlertStatus
    private let dismissButton: CustomAlertButton?
    private let primaryButton: CustomAlertButton?
    private let secondaryButton: CustomAlertButton?
}


extension BanguninAlertModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresented) {
                BanguninAlertView(title: title, message: message, alertStatus: alertStatus, dismissButton: dismissButton, primaryButton: primaryButton, secondaryButton: secondaryButton)
            }
    }
}

extension BanguninAlertModifier {

    init(title: String = "", message: String = "", alertStatus : AlertStatus , dismissButton: CustomAlertButton, isPresented: Binding<Bool>) {
        self.title         = title
        self.message       = message
        self.dismissButton = dismissButton
        self.alertStatus   = alertStatus
    
        self.primaryButton   = nil
        self.secondaryButton = nil
    
        _isPresented = isPresented
    }

    init(title: String = "", message: String = "", alertStatus : AlertStatus, primaryButton: CustomAlertButton, secondaryButton: CustomAlertButton, isPresented: Binding<Bool>) {
        self.title           = title
        self.message         = message
        self.alertStatus   = alertStatus
        self.primaryButton   = primaryButton
        self.secondaryButton = secondaryButton
    
        self.dismissButton = nil
    
        _isPresented = isPresented
    }
}


extension View {

    func alert(title: String = "", message: String = "", alertStatus : AlertStatus, dismissButton: CustomAlertButton = CustomAlertButton(title: "ok"), isPresented: Binding<Bool>) -> some View {
        let title   = NSLocalizedString(title, comment: "")
        let message = NSLocalizedString(message, comment: "")
    
        return modifier(BanguninAlertModifier(title: title, message: message, alertStatus: alertStatus, dismissButton: dismissButton, isPresented: isPresented))
    }

    func alert(title: String = "", message: String = "", alertStatus : AlertStatus, primaryButton: CustomAlertButton, secondaryButton: CustomAlertButton, isPresented: Binding<Bool>) -> some View {
        let title   = NSLocalizedString(title, comment: "")
        let message = NSLocalizedString(message, comment: "")
    
        return modifier(BanguninAlertModifier(title: title, message: message, alertStatus: alertStatus, primaryButton: primaryButton, secondaryButton: secondaryButton, isPresented: isPresented))
    }
}
