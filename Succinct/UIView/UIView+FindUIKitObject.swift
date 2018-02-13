import UIKit

// MARK: - UIButton
extension UIView {
    public func findButton(withExactText searchText: String) -> UIButton? {
        return subviews
            .flatMap { $0 as? UIButton ?? $0.findButton(withExactText: searchText) }
            .filter { $0.titleLabel?.text == searchText }
            .first
    }
}

// MARK: - Finding UILabels
extension UIView {
    public func findLabel(withExactText searchText: String) -> UILabel? {
        return subviews
            .flatMap { $0 as? UILabel ?? $0.findLabel(withExactText: searchText) }
            .filter { $0.text == searchText }
            .first
    }

    public func findLabel(containingText searchText: String) -> UILabel? {
        return subviews
            .flatMap { $0 as? UILabel ?? $0.findLabel(containingText: searchText) }
            .filter { $0.text?.contains(searchText) ?? false }
            .first
    }
}

// MARK: - Has UILabels
extension UIView {
    public func hasLabel(withExactText searchText: String) -> Bool {
        return findLabel(withExactText: searchText).isNotNil()
    }

    public func hasLabel(containingText searchText: String) -> Bool {
        return findLabel(containingText: searchText).isNotNil()
    }
}
