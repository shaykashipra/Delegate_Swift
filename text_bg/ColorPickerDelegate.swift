protocol ColorPickerDelegate: AnyObject {
    func didSelectColor(_ color: Color, for target: ColorChangeTarget)
}

enum ColorChangeTarget {
    case rectangle
    case text
}
