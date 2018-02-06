# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

# Comment the next line if you're not using Swift and don't want to use dynamic frameworks
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

def demoPlayer_pods
#    //inherit! :search_paths
pod 'RxSwift',    '~> 4.0'
pod 'Alamofire', '~> 4.6.0'
end

# Pods for CleanScoreDemo
target 'CleanScoreDemo' do
demoPlayer_pods
end

target 'CleanScoreDemoTests' do
inherit! :search_paths
# Pods for testing
end

target 'CleanScoreDemoUITests' do
inherit! :search_paths
# Pods for testing
end





