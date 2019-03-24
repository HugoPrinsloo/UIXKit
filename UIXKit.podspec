
Pod::Spec.new do |spec|


  spec.name         = "UIXKit"
  spec.version      = "0.0.1"
  spec.summary      = "UI & UX framework"
  spec.description  = "Pre-release setup"

  spec.homepage     = "https://github.com/HugoPrinsloo/UIXKit"

  spec.license      = "MIT"
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  spec.author             = { "Hugo Prinsloo" => "hugo8prinsloo@gmail.com" }
  # Or just: spec.author    = "Hugo Prinsloo"
  # spec.authors            = { "Hugo Prinsloo" => "hugo.prinsloo@icloud.com" }
  # spec.social_media_url   = "https://twitter.com/Hugo Prinsloo"


  # spec.platform     = :ios
spec.platform     = :ios, "11.0"
spec.swift_version = '4.2'



  spec.source       = { :git => "https://github.com/HugoPrinsloo/UIXKit.git", :tag => "0.0.1" }

  spec.source_files  = "UIXKit/**/*.swift"
end
