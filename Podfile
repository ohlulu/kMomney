platform :ios, '12.0'

target 'kMoney' do
  use_frameworks!
  
  # Rx
  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa',    '~> 4.0'
  pod "RxGesture"
  pod "RxRealm"
  
  # DB
  pod 'RealmSwift'
  
  # UI
  pod 'Charts'
  pod 'SnapKit', '~> 5.0.0'
  pod 'EFCountingLabel'
  pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git'
  pod 'FSCalendar'

  target 'kMoneyTests' do
    inherit! :search_paths
    
  end

  target 'kMoneyUITests' do
    inherit! :search_paths
    
  end

end
