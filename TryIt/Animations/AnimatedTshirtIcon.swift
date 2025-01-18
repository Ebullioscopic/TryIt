import SwiftUI

struct AnimatedTshirtIcon: View {
    var body: some View {
        AnimatedMeshView()
            // Mask the gradient with the T-shirt SF Symbol
            .mask(
                Image(systemName: "tshirt")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            )
            // Give it a reasonable size for a tab icon
            .frame(width: 25, height: 25)
    }
}
