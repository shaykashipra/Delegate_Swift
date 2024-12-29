import SwiftUI

struct MainView: View {
    @State private var rectangleColor: Color = .gray // Default color
    @State private var isPickerPresented: Bool = false // For showing the popup

    var body: some View {
        ZStack {
            rectangleColor
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Rectangle()
                    .fill(rectangleColor)
                    .frame(width: 200, height: 100)
                    .cornerRadius(10)
                    .shadow(radius: 5)

                Button("Change Background Color") {
                    isPickerPresented = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .sheet(isPresented: $isPickerPresented) {
            ColorPickerHost(delegate: self, isPresented: $isPickerPresented)
        }
    }
}

extension MainView: ColorPickerDelegate {
    func didSelectColor(_ color: Color) {
        self.rectangleColor = color
    }
}
