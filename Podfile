platform :ios, '12.0'

target 'kMoney' do
  use_frameworks!
  
  pod 'Reveal-SDK', :configurations => ['Debug']
  
  pod 'OhSwifter'
  
  # Rx
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxGesture'
  pod 'RxDataSources', '~> 4.0'

  # DB
  pod 'RealmSwift'

  # UI
  pod 'Charts'
  pod 'SnapKit', '~> 5.0.0'
  pod 'EFCountingLabel'
  pod 'ChameleonFramework/Swift', :git => 'https://github.com/wowansm/Chameleon.git', :branch => 'swift5'
  pod 'FSCalendar'
  pod 'IQKeyboardManagerSwift'

  target 'kMoneyTests' do
    inherit! :search_paths
    
  end

  target 'kMoneyUITests' do
    inherit! :search_paths
    
  end

end
