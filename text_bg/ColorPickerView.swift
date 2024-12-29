import SwiftUI

struct ColorPickerView: View {
    weak var delegate: ColorPickerDelegate?
    var target: ColorChangeTarget

    @State private var selectedColor: Color = .white
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Choose a Color")
                .font(.headline)

            ColorPicker("Select Color", selection: $selectedColor)
                .padding()

            Button("Confirm") {
                delegate?.didSelectColor(selectedColor, for: target)
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}
