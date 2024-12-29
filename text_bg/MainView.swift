import SwiftUI

struct MainView: View {
    @State private var rectangleColor: Color = .gray
    @State private var textColor: Color = .black
    @State private var showColorPicker = false
    @State private var target: ColorChangeTarget = .rectangle // Keeps track of what to change

    var body: some View {
        VStack {
            Rectangle()
                .fill(rectangleColor)
                .frame(height: 200)
                .cornerRadius(10)
                .padding()

            Text("Change my color!")
                .font(.title)
                .foregroundColor(textColor)

            HStack {
                Button("Change Rectangle Color") {
                    target = .rectangle
                    showColorPicker = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Change Text Color") {
                    target = .text
                    showColorPicker = true
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
        }
        .sheet(isPresented: $showColorPicker) {
            ColorPickerView(delegate: self, target: target)
        }
    }
}

extension MainView: ColorPickerDelegate {
    func didSelectColor(_ color: Color, for target: ColorChangeTarget) {
        switch target {
        case .rectangle:
            rectangleColor = color
        case .text:
            textColor = color
        }
    }
}
