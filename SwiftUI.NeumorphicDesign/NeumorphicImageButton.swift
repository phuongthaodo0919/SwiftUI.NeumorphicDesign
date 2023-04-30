//
//  NeumorphicImageButton.swift
//  SwiftUI.NeumorphicDesign
//
//  Created by Salmdo on 4/29/23.
//

import SwiftUI

struct NeumorphicImageButton: View {
    @State var isPressed: Bool = false
    
    private var systemName: String
    private var size: CGSize
    private var onTap: () -> Void
    
    init(systemName: String, size: CGSize = CGSize(width: 60, height: 60), onTap: @escaping () -> Void) {
        self.systemName = systemName
        self.size = size
        self.onTap = onTap
    }
    
    private var lightGray: Color {
        return Color(uiColor: UIColor(red: 0.96, green: 0.95, blue: 0.95, alpha: 1.00))
    }
    
    private var darkGray: Color {
        return Color(uiColor: UIColor(red: 0.51, green: 0.58, blue: 0.77, alpha: 1.00))
    }
    
    
    var body: some View {
        Button(action: {
            self.isPressed = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                self.isPressed = false
                self.onTap()
            }
        }) {
            Image(systemName: systemName)
                .resizable()
                .frame(width: size.width , height: size.height)
                .padding(20)
                .foregroundColor(Color(uiColor: UIColor(red: 0.08, green: 0.42, blue: 0.58, alpha: 1.00)))
                .background(Color(uiColor: UIColor(red: 0.86, green: 0.87, blue: 0.92, alpha: 1.00)))
        }
        .clipShape(Circle())
        .shadow(color: isPressed ? lightGray : darkGray, radius: isPressed ? 4 : 8, x: 8, y: 8)
        .shadow(color: isPressed ? darkGray : lightGray, radius: isPressed ? 4 : 8, x: -4, y: -4)
        .scaleEffect(isPressed ? 0.95 : 1.00)
        .animation(.spring())
        
    }
}

struct NeumorphicImageButton_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicImageButton(systemName: "heart.fill", onTap:  {})
    }
}
