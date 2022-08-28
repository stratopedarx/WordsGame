//
//  CommonAlert.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 07.08.2022.
//

import SwiftUI

// MARK: - Common Alert as View's method

extension View {
    @ViewBuilder func commonAlert(
        isPresented: Binding<Bool>,
        errorTitle: String = Localizable.errorTitle.localized,
        errorDescription: String,
        actionIsDestructive: Bool = false,
        actionButtonTitle: String = Localizable.retry.localized,
        cancelButtonTitle: String? = nil,
        action: (() -> Void)? = nil,
        cancel: (() -> Void)? = nil
    ) -> some View {
        self.modifier(CommonAlertModifier(
            isPresented: isPresented,
            errorTitle: errorTitle,
            errorDescription: errorDescription,
            actionIsDestructive: actionIsDestructive,
            actionButtonTitle: actionButtonTitle,
            cancelButtonTitle: cancelButtonTitle,
            action: action,
            cancel: cancel
        ))
    }
}

// MARK: - Common Alert Modifier

struct CommonAlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    var errorTitle: String
    var errorDescription: String
    var actionIsDestructive: Bool
    var actionButtonTitle: String
    var cancelButtonTitle: String?
    var action: (() -> Void)?
    var cancel: (() -> Void)?

    func body(content: Content) -> some View {
        content
            .alert(isPresented: $isPresented) {
                if let action = action {
                    return Alert(
                        title: Text(errorTitle),
                        message: Text(errorDescription),
                        primaryButton: cancelButtonTitle != nil ? .default(
                            Text(cancelButtonTitle ?? Localizable.cancel.localized), action: cancelAction)
                        : .cancel(),
                        secondaryButton: actionIsDestructive ? .destructive(
                            Text(actionButtonTitle), action: cancelAction)
                        : .default(
                            Text(actionButtonTitle),
                            action: action
                        )
                    )
                } else {
                    return Alert(
                        title: Text(errorTitle),
                        message: Text(errorDescription),
                        dismissButton: .default(Text(Localizable.ok.localized), action: cancelAction)
                    )
                }
            }
    }
}

// MARK: - Cancel Button

extension CommonAlertModifier {
    var cancelAction: (() -> Void)? {
        cancel == nil ? { isPresented = false } : cancel
    }
}
