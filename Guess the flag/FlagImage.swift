//
//  FlagImage.swift
//  Guess the flag
//
//  Created by Olaleye Daniel Ifeoluwa on 06/11/2023.
//

import SwiftUI
struct LargeBlueTitle: ViewModifier{
    func body(content : Content) -> some View {
        content
            .font(.largeTitle)
            .background(.blue)
    }
}
extension View{
    func title() -> some View{
        modifier( LargeBlueTitle())
    }
}

struct FlagImage: View {
    var name: String
@ViewBuilder var body: some View{
        Image(name)
        .renderingMode(.original)
        .clipShape(Capsule())
        .shadow(radius: 5)
        
        
    }
}


struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(name: "France")
    }
}
