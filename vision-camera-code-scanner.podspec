require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "vision-camera-code-scanner"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "11.0" }
  s.source       = { :git => "https://github.com/rodgomesc/vision-camera-code-scanner.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,mm,swift}"

  s.dependency "React-Core"
  s.dependency "GoogleMLKit/BarcodeScanning"
  if defined?($VCCSAsStaticFramework)
    Pod::UI.puts "#{s.name}: Using overridden static_framework value of '#{$VCCSAsStaticFramework}'"
    s.static_framework = $VCCSAsStaticFramework
  else
    s.static_framework = false
  end
end
