//
//  MainTabbarViewController.m
//  ios-demo
//
//  Created by 曹先运 on 2020/7/16.
//  Copyright © 2020 Tee-cxy. All rights reserved.
//

#import "MainTabbarViewController.h"
#import "HomeController.h"
#import "ChannelController.h"
#import "BuyController.h"
#import "MineController.h"
#import "BaseNavigationController.h"

@interface MainTabbarViewController ()

@end

@implementation MainTabbarViewController

+ (void)initialize {
    
    [[UITabBar appearance] setTranslucent:NO];
    
    [UITabBar appearance].barTintColor = [UIColor whiteColor];
    
    UITabBarItem * item = [UITabBarItem appearance];
    item.titlePositionAdjustment = UIOffsetMake(0, 1.5);
    
    NSMutableDictionary * normalatts = [NSMutableDictionary dictionary];
    normalatts[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    normalatts[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalatts forState:UIControlStateNormal];
    
    NSMutableDictionary * selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor systemPinkColor];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewControllerWithClassName:[HomeController description] imageName:@"首页icon" title:@"首页"];
    
     [self addChildViewControllerWithClassName:[ChannelController description] imageName:@"频道icon" title:@"频道"];
    
     [self addChildViewControllerWithClassName:[BuyController description] imageName:@"会员购icon" title:@"会员购"];
    
     [self addChildViewControllerWithClassName:[MineController description] imageName:@"我的icon" title:@"我的"];
    
//    BaseNavigationController * homeNav = (BaseNavigationController *)self.viewControllers.firstObject;
//    HomeController * home = (HomeController *)homeNav.viewControllers.firstObject;
    
}

- (void)addChildViewControllerWithClassName:(NSString *)classname imageName:(NSString *)imageName title:(NSString *)title
{
    UIViewController * vc = [[NSClassFromString(classname) alloc]init];
    BaseNavigationController * nav = [[BaseNavigationController alloc]initWithRootViewController:vc];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
    nav.tabBarItem.imageInsets = UIEdgeInsetsMake(25, 20, 18, 20);
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:[imageName stringByAppendingString:@"_selected"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:nav];
}


@end
