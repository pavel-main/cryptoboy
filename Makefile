lint:
	./Pods/SwiftLint/swiftLint --fix ./cryptoboy

clean:
	rm -rf ~/Library/Developer/Xcode/DerivedData

pods-update:
	rm -rf Pods
	rm -rf Podfile.lock
	rm -rf cryptoboy.xcworkspace
	pod cache clean --all
	pod install --repo-update

.PHONY: lint clean pods-update