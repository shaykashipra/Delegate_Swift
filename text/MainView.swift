import SwiftUI

struct MainView: View, ColorPickerDelegate {
    @State private var textColor: Color = .black // Default text color
    @State private var isColorPickerPresented: Bool = false // Control the pop-up

    var body: some View {
        VStack(spacing: 20) {
            // First Button - Displays Text
            Button("First Button") {
                print("First button pressed")
            }
            .foregroundColor(textColor) // Dynamically updates based on the color
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)

            // Second Button - Opens Color Picker
            Button("Change Text Color") {
                isColorPickerPresented = true // Open the color picker
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .sheet(isPresented: $isColorPickerPresented) {
            ColorPickerView(delegate: self) // Pass delegate
        }
    }

    // MARK: - Delegate Method
    func didChangeTextColor(to color: Color) {
        textColor = color // Update the color of the first button's text
        isColorPickerPresented = false // Dismiss the pop-up
    }
}
