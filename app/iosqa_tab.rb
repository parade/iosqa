# Snippits via https://raw.githubusercontent.com/HipByte/RubyMotionSamples/master/ios/PaintHTML/app/web_view_controller.rb
# Icon via https://raw.githubusercontent.com/HipByte/RubyMotionSamples/master/ios/Beers/resources/map.png
class IOSQATab < UIViewController

  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Tab', image: UIImage.imageNamed('map.png'), tag: 1)
    end
    self
  end

  def loadView
    self.view = UIView.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    self.view.backgroundColor = UIColor.whiteColor
  end

  #def viewDidAppear(animated)
  #  navigationController.setNavigationBarHidden(false, animated:true)
  #end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(true, animated:true)
  end

  def showTab(tab)
    @webView = UIWebView.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    @webView.backgroundColor = UIColor.grayColor
    @webView.scalesPageToFit = true
    #@webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
    @webView.delegate = self
    self.tabBarItem.title = tab[ :title ]
    @webView.loadRequest(NSURLRequest.requestWithURL(NSURL.URLWithString(tab[ :url ])))
  end

  # True if we're showing a status bar that's not translucent
  def wantsFullScreenLayout
    false
  end

  # Only add the web view when the page has finished loading
  def webViewDidFinishLoad(webView)
    self.view.addSubview(@webView)
  end

  # Enable rotation
  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    # On the iPhone, don't rotate to upside-down portrait orientation
    if UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPad
      if interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown
        return false
      end
    end
    true
  end

  def webView(inWeb, shouldStartLoadWithRequest:inRequest, navigationType:inType)
    # Open absolute links in Mobile Safari
    #if inType == UIWebViewNavigationTypeLinkClicked && inRequest.URL.scheme != 'file'
    #  UIApplication.sharedApplication.openURL(inRequest.URL)
    #  return false
    #end
    true
  end

end
