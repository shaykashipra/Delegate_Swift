import SwiftUI

struct MainView: View {
    @State private var rectangleColor: Color = .gray // Initial color for the rectangle
    @State private var isPickerPresented: Bool = false // To control popup visibility

    var body: some View {
        ZStack {
            rectangleColor
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // Rectangle
                Rectangle()
                    .fill(rectangleColor)
                    .frame(width: 200, height: 100)
                    .cornerRadius(10)
                    .shadow(radius: 5)

                HStack(spacing: 20) {
                    // Button to open color picker
                    Button("Change Background Color") {
                        isPickerPresented = true
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    // Button to set a default color
                    Button("Set Default Color") {
                        rectangleColor = .cyan // Set your desired default color here
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
        .sheet(isPresented: $isPickerPresented) {
            ColorPickerHost(delegate: self, isPresented: $isPickerPresented)
        }
    }
}

// Delegate extension to handle color selection
extension MainView: ColorPickerDelegate {
    func didSelectColor(_ color: Color) {
        self.rectangleColor = color
    }
}
