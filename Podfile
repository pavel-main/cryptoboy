platform :ios, '12.0'

target 'cryptoboy' do
    pod 'SwiftLint'
    pod 'Introspect'
    pod 'BigInt', :git => 'https://github.com/CryptoboyApp/BigInt.git'
    pod 'SwiftySSS', :git => 'https://github.com/CryptoboyApp/SwiftySSS.git'
    pod 'TrustWalletCore'

    post_install do |installer|
        installer.pods_project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
            end
        end
    end
end
