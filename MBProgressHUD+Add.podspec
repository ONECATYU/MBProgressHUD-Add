
Pod::Spec.new do |s|

  s.name         = "MBProgressHUD+Add"
  s.version      = "0.0.2"
  s.summary      = "给UIView和UIViewController添加HUD扩展,以便使用."
  s.homepage     = "https://github.com/ONECATYU/MBProgressHUD-Add"
  s.author             = { "capsule" => "786910875" }
  s.platform     = :ios, "8.0"
  s.source       = {
                        :git => "https://github.com/ONECATYU/MBProgressHUD-Add.git",
                        :tag => s.version.to_s
                    }
  s.source_files  = "MBProgressHUD+Add", "MBProgressHUD+Add/**/*.{h,m}"
  s.frameworks       = "UIKit", "Foundation"
  s.requires_arc = true
  s.dependency "MBProgressHUD", "~> 1.0.0"

end
