//
//  ViewController.m
//  SmileEveryday
//
//  Created by steve on 2020/8/27.
//

#import "ViewController.h"
#import <WidgetKit/WidgetKit.h>
#import "SmileEveryday-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat y = 100;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor orangeColor];
    button.frame = CGRectMake(self.view.frame.size.width/2 - 250/2, y + 10, 250, 40);
    [button setTitle:@"TEST" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(testClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)testClick {
    
    NSLog(@"reloadTimelines");
    
    [WidgetManager reloadTimelines];
}

@end
