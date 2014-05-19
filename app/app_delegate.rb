class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @config = BW::JSON.parse(NSData.dataWithContentsOfFile(NSBundle.mainBundle.pathForResource("config", ofType:"json")))
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    UIApplication.sharedApplication.setStatusBarHidden(true, withAnimation:UIStatusBarAnimationFade)
    tabbar = UITabBarController.alloc.init
    tabbar.selectedIndex = 0
    tabs = []
    @config[ :pages ].each do |page|
      tab = IOSQATab.alloc.init
      tab.showTab( page )
      tabs.push(tab)
    end
    tabbar.viewControllers = tabs
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(tabbar)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
end
