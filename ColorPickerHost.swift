import SwiftUI

struct ColorPickerHost: UIViewControllerRepresentable {
    weak var delegate: ColorPickerDelegate? // Delegate reference
    @Binding var isPresented: Bool

    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        let hostingController = UIHostingController(
            rootView: ColorPickerView(delegate: delegate, isPresented: $isPresented)
        )
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.addSubview(hostingController.view)
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: vc.view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor)
        ])
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
