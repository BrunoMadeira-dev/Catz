//
//  CatzFramework.swift
//  Catz
//
//  Created by Bruno Madeira on 19/08/2024.
//

import Foundation

struct Framework: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
}


struct MockData {
    
    static let sampleFramework = Framework(name: "ARKit",
                                           imageName: "cat.fill",
                                           description: "ARKit 4 introduces a brand-new Depth API, creating a new way to access the detailed depth information gathered by the LiDAR Scanner on iPhone 12 Pro, iPhone 12 Pro Max, and iPad Pro.\n\nLocation Anchors leverages the higher-resolution data in Apple Maps to place AR experiences at a specific point in the world in your iPhone and iPad apps. And support for face tracking extends to all devices with the Apple Neural Engine and a front-facing camera, so even more users can experience the joy of AR in photos and videos.")
}
