//
//  extensions.swift
//  Quantum_AR
//
//  Created by Sameer Nikhil on 28/12/23.
//

import Foundation
import SwiftUI

extension Comparable {
    func clamp<T: Comparable>(lower: T, _ upper: T) -> T {
        return min(max(self as! T, lower), upper)
    }
}

extension CGSize {
    static var inactiveThumbSize:CGSize {
        return CGSize(width: 70, height: 70)
    }
    
    static var activeThumbSize:CGSize {
        return CGSize(width: 85, height: 70)
    }
    
    static var trackSize:CGSize {
        return CGSize(width: 280, height: 70)
    }
}


extension CGSize {
    
    static var inactiveThumbsize:CGSize{
        return CGSize(width: 70, height: 50)
    }
    static var activeThumbsize:CGSize {
        return CGSize(width: 85, height: 50)
    }
    static var tracksize:CGSize {
        return CGSize(width: 280, height: 50)
    }
}
