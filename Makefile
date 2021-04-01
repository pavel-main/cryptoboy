open:
	xed .

install:
	pod install

lint:
	./Pods/SwiftLint/swiftLint --fix ./cryptoboy

.PHONY: open install lint