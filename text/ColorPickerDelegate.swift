import SwiftUI

protocol ColorPickerDelegate: AnyObject {
    func didChangeTextColor(to color: Color)
}
