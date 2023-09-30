# Swift
Swift Sample Projects

- https://github.com/Wua4/FlexStackView
- https://github.com/Wua4/DynamicFont

    - [x] DEVELOP SAMPLE PACKAGES
        - [x] Need to use via local and remote dependency. 
            - [x] Local - Add package to project?
                - [x]  DynamicFont
            - [x] Remote -  Dependencies file
                - [x] Realm
                - [x] FlexStackView
        - [x] Problem 1: FlexStackView, Flexbox style layout with UIKit and Swift UI
            - [x] Handle adjustable font, landscape, iPad
            - [x] Criteria:  
                - [x] Preset for individual row (e.g. 2 for first row, but 1 for else) 
                - [x] Max allowed per row
                - [x] lineLimit for labels = 2, except if label is one word,  lineLimit = 1
        - [x] Problem 2: DynamicFont, Reasonable Dynamically Sized Font Library
            - [x] Normal iOS HIG are too large in Large Text accesibility size
                - [x] Convert normal+large to use normal size.
            - [x] Leave iPad alone
            - [x] Ease of use prioritized
                - [x] Init functions handle Observers
                - [x] Handle storyboard button issue (Type:System/Style:Default) - CANT
                - [x] Simple naming
            - [x] See if override UILabel allowed (Care for buttons/attributed text) - NO, TOO DANGEROUS
                - [ ] Storyboard
                - [ ] ViewController (titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
