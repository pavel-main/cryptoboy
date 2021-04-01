install:
	pod install

lint:
	./Pods/SwiftLint/swiftLint --fix ./cryptoboy

.PHONY: install lint