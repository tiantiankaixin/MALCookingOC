//
//  MarketViewController.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "MarketViewController.h"

@interface MarketViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MarketViewController

+ (MarketViewController *)marketVC
{
    UIStoryboard *marketSTB = StoryBoardWithName(@"Market");
    return [marketSTB instantiateViewControllerWithIdentifier:@"market"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:MALURL(MarketUrl)]];
    // Do any additional setup after loading the view.
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
