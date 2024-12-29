import Foundation
import SwiftUI

protocol ColorPickerDelegate: AnyObject {
    func didSelectColor(_ color: Color)
}
