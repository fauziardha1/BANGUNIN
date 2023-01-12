//
//  AlertButton.swift
//  BANGUNIN
//
//  Created by FauziArda on 12/01/23.
//

import SwiftUI

struct CustomAlertButton: View {

    // MARK: - Value
    // MARK: Public
    let title: LocalizedStringKey
    var action: (() -> Void)? = nil
    
    
    // MARK: - View
    // MARK: Public
    var body: some View {
        Button {
          action?()
        
        } label: {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding( 10)
        }
        .frame(height: 56)
        .background(.green)
        .cornerRadius(.infinity)
        .padding(.horizontal)
        
    }
}

struct AlertButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertButton(title: LocalizedStringKey(stringLiteral: "Hello"))
    }
}
