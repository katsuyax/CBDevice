Pod::Spec.new do |spec|
  spec.name         = "CBDevice"
  spec.version      = "1.0.4"
  spec.summary      = "Get model name and code of the iOS / iPadOS devices."
  spec.homepage     = "https://github.com/katsuyax/CBDevice"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "CrossBridge(Katsuya Kato)" => "crossbridge.kato@gmail.com" }
  spec.platform     = :ios, "14.0"
  spec.swift_versions = "5.0"
  spec.source       = { :git => "https://github.com/katsuyax/CBDevice.git", :tag => "#{spec.version}" }
  spec.source_files = "Sources/**/*.{swift}"
end
