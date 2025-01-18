import SwiftUI

struct AnimatedMeshIconAsImage: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let hostingController = UIHostingController(rootView: AnimatedTshirtIcon())
        hostingController.view.backgroundColor = .clear // Transparent background
        hostingController.view.frame = CGRect(x: 0, y: 0, width: 30, height: 30) // Icon size
        return hostingController.view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // No updates needed for static content
    }
}

extension View {
    func toUIImage(size: CGSize) -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = CGSize(width: size.width, height: size.height)
        let format = UIGraphicsImageRendererFormat()
        format.scale = UIScreen.main.scale
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: CGRect(origin: .zero, size: targetSize), afterScreenUpdates: true)
        }
    }
}
