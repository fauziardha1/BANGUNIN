//
//  BanguninAlertView.swift
//  BANGUNIN
//
//  Created by FauziArda on 12/01/23.
//

import SwiftUI
enum AlertStatus {
    case success
    case failed
    case deleted
    case confirmToDelete
}
struct BanguninAlertView: View {
    
    // MARK: - Value
    // MARK: Public
    let title: String
    let message: String
    let alertStatus : AlertStatus
    let dismissButton: CustomAlertButton?
    let primaryButton: CustomAlertButton?
    let secondaryButton: CustomAlertButton?
    
    // MARK: Private
    @State private var opacity: CGFloat           = 0
    @State private var backgroundOpacity: CGFloat = 0
    @State private var scale: CGFloat             = 0.001

    @Environment(\.dismiss) private var dismiss


    // MARK: - View
    // MARK: Public
    var body: some View {
        ZStack {
            dimView
    
            alertView
                .scaleEffect(scale)
                .opacity(opacity)
        }
        .ignoresSafeArea()
        .transition(.opacity)
        .task {
            animate(isShown: true)
        }
    }

    
    private var alertView: some View {
        VStack(spacing: 10) {
            image
            titleView
            messageView
            buttonsView
        }
        .padding(24)
        .frame(width: 320)
        .background(.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.4), radius: 16, x: 0, y: 12)
    }
    
    @ViewBuilder
    private var image: some View {
        let emoji : String = {
            var text = ""
            if self.alertStatus == AlertStatus.success {
                text = "🥳"
            } else if self.alertStatus == AlertStatus.confirmToDelete {
                text = "🥺"
            } else if self.alertStatus == AlertStatus.deleted{
                text = "🫠"
            }
            
            return text
        }()
        Text(emoji)
            .font(.system(size: 160, weight: .bold))
            
    }
    

    @ViewBuilder
    private var titleView: some View {
        if !title.isEmpty {
            Text(title)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color(uiColor: UIColor(red: 0.24, green: 0.33, blue: 0.51, alpha: 1.00)))
                .lineSpacing(24 - UIFont.systemFont(ofSize: 18, weight: .bold).lineHeight)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }

    @ViewBuilder
    private var messageView: some View {
        if !message.isEmpty {
            Text(message)
                .font(.system(size: title.isEmpty ? 18 : 16))
                .foregroundColor(title.isEmpty ? .black : .gray)
                .lineSpacing(24 - UIFont.systemFont(ofSize: title.isEmpty ? 18 : 16).lineHeight)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }

    private var buttonsView: some View {
        HStack(spacing: 12) {
            if dismissButton != nil {
                dismissButtonView
    
            } else if primaryButton != nil, secondaryButton != nil {
                secondaryButtonView
                primaryButtonView
            }
        }
        .padding(.top, 23)
    }

    @ViewBuilder
    private var primaryButtonView: some View {
        if let button = primaryButton {
            CustomAlertButton(title: button.title) {
                animate(isShown: false) {
                    dismiss()
                }
            
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    button.action?()
                }
            }
        }
    }

    @ViewBuilder
    private var secondaryButtonView: some View {
        if let button = secondaryButton {
            CustomAlertButton(title: button.title) {
                animate(isShown: false) {
                    dismiss()
                }
        
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    button.action?()
                }
            }
        }
    }

    @ViewBuilder
    private var dismissButtonView: some View {
        if let button = dismissButton {
            CustomAlertButton(title: button.title) {
                animate(isShown: false) {
                    dismiss()
                }
        
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    button.action?()
                }
            }
        }
    }

    private var dimView: some View {
        Color.gray
            .ignoresSafeArea()
            .opacity(0.1)
    }


    // MARK: - Function
    // MARK: Private
    private func animate(isShown: Bool, completion: (() -> Void)? = nil) {
        switch isShown {
        case true:
            opacity = 1
    
            withAnimation(.spring(response: 0.3, dampingFraction: 0.9, blendDuration: 0).delay(0.5)) {
                backgroundOpacity = 1
                scale             = 1
            }
    
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                completion?()
            }
    
        case false:
            withAnimation(.easeOut(duration: 0.2)) {
                backgroundOpacity = 0
                opacity           = 0
            }
    
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                completion?()
            }
        }
    }
}

#if DEBUG
struct CustomAlert_Previews: PreviewProvider {

    static var previews: some View {
        let dismissButton   = CustomAlertButton(title: "Back to Home")
        let primaryButton   = CustomAlertButton(title: "OK")
        let secondaryButton = CustomAlertButton(title: "Cancel")

        let title = "Alarm Created"
        let message = "Your alarm has been created!\n Sit back and we’ll wake you up\n when you get close "

        return VStack {
            BanguninAlertView(title: title, message: message, alertStatus: AlertStatus.success, dismissButton: dismissButton,           primaryButton: nil,           secondaryButton: nil)
        }
        .previewDevice("iPhone 13 Pro Max")
        .preferredColorScheme(.light)
    }
}
#endif
