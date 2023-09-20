import XCTest
@testable import DynamicFont

final class DynamicFontTests: XCTestCase {
    func testExample() throws {
        let contentSize = UIApplication.shared.preferredContentSizeCategory
        let size = UIFontDescriptor.iOSFontSizeTable[.body]?[contentSize] ?? 0

        XCTAssertEqual(DynamicFont.preferredFont(forTextStyle: .body).pointSize, size)
    }
}
