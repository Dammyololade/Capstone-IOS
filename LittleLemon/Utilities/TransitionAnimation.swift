//
//  TransitionAnimation.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 19.08.23.
//

import Foundation
import SwiftUI

extension AnyTransition {
    static var pageTransition: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct SlidingDoorEffect: ViewModifier {
    let shift: CGFloat
    
    func body(content: Content) -> some View {
        let c = content
        return ZStack {
            c.clipShape(HalfClipShape(left: false)).offset(x: -shift, y: 0)
            c.clipShape(HalfClipShape(left: true)).offset(x: shift, y: 0)
        }
    }
}

struct HalfClipShape: Shape {
    var left: Bool
        
    func path(in rect: CGRect) -> Path {
        // shape covers lef or right part of rect
        return Path { path in
            let width = rect.width
            let height = rect.height
            
            let startx:CGFloat = left ? 0 : width/2
            let shapeWidth:CGFloat = width/2
            
            path.move(to: CGPoint(x: startx, y: 0))
            
            path.addLines([
                CGPoint(x: startx+shapeWidth, y: 0),
                CGPoint(x: startx+shapeWidth, y: height),
                CGPoint(x: startx, y: height),
                CGPoint(x: startx, y: 0)
            ])
        }
    }
}
