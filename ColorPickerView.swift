import SwiftUI

struct ColorPickerView: View {
    weak var delegate: ColorPickerDelegate? // Use a weak delegate reference to avoid retain cycles
    @Binding var isPresented: Bool // To dismiss the popup

    let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .purple]

    var body: some View {
        VStack(spacing: 20) {
            Text("Choose a Color")
                .font(.headline)
                .padding()

            ForEach(colors, id: \.self) { color in
                Button {
                    delegate?.didSelectColor(color)
                    isPresented = false // Dismiss the popup
                } label: {
                    Circle()
                        .fill(color)
                        .frame(width: 50, height: 50)
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).shadow(radius: 10))
    }
}
