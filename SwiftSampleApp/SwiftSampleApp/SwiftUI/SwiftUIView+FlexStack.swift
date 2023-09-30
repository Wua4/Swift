//
//  SwiftUIView+FlexStack.swift
//  SwiftSampleApp
//
//  Created by Allen on 9/29/23.
//

import SwiftUI
import FlexStackView

struct SwiftUIView_FlexStack: View {
    weak var navigationController: UINavigationController?
    let flexSwiftController = FlexSwiftView()
    @State private var viewArray: [[String]] = []
    let contentObserver = NotificationCenter.default.publisher(for: UIContentSizeCategory.didChangeNotification)

    var body: some View {
        VStack(alignment: .leading) {
            ForEach((0..<viewArray.count), id: \.self) { rowNum in
                getRow(rowNum)
            }
        }
        .background(.blue)
        .frame(alignment: .center)
        .onAppear(perform: reloadBody)
        .onReceive(contentObserver, perform: { _ in
            self.reloadBody()
        })
    }

    func reloadBody() {
        flexSwiftController.presetItemsinRow[0] = 4
        flexSwiftController.clearAllViews()

        for i in 0...3 {
            let label =  "Longer Label --- \(i)"
            let font = UIFont.preferredFont(forTextStyle: .body)
            flexSwiftController.addText(adjustsForText: label, font: font, 5)
        }

        viewArray = flexSwiftController.getTextArray()
    }

    func getRow(_ num: Int) -> some View {
        return HStack(spacing: 0) {
            ForEach((0..<viewArray[num].count), id: \.self) { i in
                getText(viewArray[num][i])
            }.background(.gray)
        }
    }

    func getText(_ text: String) -> some View {
        let text = Text(text)
                .background(.yellow)
                .padding(5)
                .frame(maxWidth: .infinity)

        return text
    }
}

struct SwiftUIView_FlexStack_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_FlexStack()
    }
}


//
//NotificationCenter.default.addObserver(self, selector: #selector(preferredContentSizeChanged(_:)),
//                                       name: UIContentSizeCategory.didChangeNotification, object: nil)
//}
//
//@objc open func preferredContentSizeChanged(_ notification: Notification) {
//print("Must override")
//}


public class TextWithSettings {
    public var text: String = ""
    public var font: UIFont = UIFont.preferredFont(forTextStyle: .body)
    public var offset: Int = 0

    init(text: String, font: UIFont, offset: Int) {
        self.text = text
        self.font = font
        self.offset = offset
    }
}

public class FlexSwiftView {
    // default number of items per row
    // will defer lower if content expands
    var views = [TextWithSettings]()
    var defaultPerRow = 1
    var isAdjustable = true
    var lineLimit: CGFloat = 2



    // set preset for certain row
    // will defer lower if content expands
    public var presetItemsinRow = [Int: Int]()

    public func addText(adjustsForText text: String, font: UIFont, _ offset: Int = 0) {
        let newView = TextWithSettings(text: text, font: font, offset: offset)
        views.append(newView)
    }

    public func clearAllViews() {
        views = []
    }


    public func checkIfViewFits(width: CGFloat, _ view: TextWithSettings) -> Bool {
        let font = view.font
        let textAttributes = [NSAttributedString.Key.font: font]

        var maxLines = lineLimit
        if !view.text.contains(" ") {
            maxLines = 1
        }
        let singleLineText = "A" as NSString
        let singleLineHeight = singleLineText.boundingRect(with: CGSizeMake(100, 100), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil).size.height

        let textInView = view.text as NSString
        // Some weird math involved in SwiftUI version, good enough, not worth fine-tuning further
        let calculatedSize = textInView.boundingRect(with: CGSizeMake(width - 5.3, .greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil).size

        return calculatedSize.height <= (singleLineHeight * maxLines + CGFloat(view.offset)/2)
    }



    public func getTextArray() -> [[String]] {
        var viewArray: [[String]] = []
        var row = 0
        var viewIndex = 0
        while viewIndex < views.count {
            var numForRow = defaultPerRow
            if let presetItems = presetItemsinRow[row] {
                numForRow = presetItems
            }

            var currentStack = [String]()

            let width = UIScreen.main.bounds.width

            for numItemsToTry in (1...numForRow).reversed() {
                var itemsFit = true

                // if adjustable turned on, if item to try in Row > 1
                // confirm if each view will fit
                if numItemsToTry != 1, isAdjustable {
                    for i in viewIndex..<(viewIndex + numItemsToTry) where i < views.count {
                        itemsFit = itemsFit && checkIfViewFits(width: width/CGFloat(numItemsToTry), views[i])
                    }
                }

                if itemsFit {
                    let num = viewIndex
                    for i in num..<(num + numItemsToTry) where i < views.count {
                        currentStack.append(views[i].text)
                        viewIndex += 1
                    }
                    viewArray.append(currentStack)
                    break
                } else {
                    continue
                }
            }
            row += 1
        }

        return viewArray
    }

}



