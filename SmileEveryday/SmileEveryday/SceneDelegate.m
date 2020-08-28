//
//  SceneDelegate.m
//  SmileEveryday
//
//  Created by steve on 2020/8/27.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts{
    NSLog(@"openURLContexts");
    
    for (UIOpenURLContext *urlContext in URLContexts) {
        NSString *str = urlContext.URL.absoluteString;
        NSLog(@"%@",str);
    }
}

@end
