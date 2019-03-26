//
//  LPPremiumWebViewController.m
//  LessonPepper
//
//  Created by ~JunBjn~ on 3/26/19.
//  Copyright © 2019 RSD. All rights reserved.
//

#import "LPPremiumWebViewController.h"

@interface LPPremiumWebViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *webkitView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *forwardBtn;

@end

@implementation LPPremiumWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.webkitView.navigationDelegate = self;
    [self setupBtn];
    NSString *urlString = @"https://www.hotpepper.jp/premium";
    NSURL *url = [NSURL URLWithString:urlString];
    
    // Place the URL in a URL Request.
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                         timeoutInterval:10.0];
    // Load Request into WebView.
    [self.webkitView loadRequest:request];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    decisionHandler(WKNavigationActionPolicyAllow);
    [self setupBtn];
}

- (IBAction)backAction:(id)sender {
    [self.webkitView goBack];
    [self setupBtn];
}

- (IBAction)forwardAction:(id)sender {
    [self.webkitView goForward];
    [self setupBtn];
}

- (IBAction)reloadAction:(id)sender {
    [self.webkitView reload];
}

- (void)setupBtn {
    self.backBtn.enabled = self.webkitView.canGoBack;
    self.forwardBtn.enabled = self.webkitView.canGoForward;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
