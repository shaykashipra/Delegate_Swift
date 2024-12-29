import SwiftUI

struct ColorPickerView: View {
    weak var delegate: ColorPickerDelegate?
    @State private var selectedColor: Color = .black

    var body: some View {
        VStack {
            Text("Choose a Color")
                .font(.headline)
                .padding()

            ColorPicker("Select Text Color", selection: $selectedColor)
                .padding()

            Button("Apply Color") {
                delegate?.didChangeTextColor(to: selectedColor) // Notify delegate
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}
