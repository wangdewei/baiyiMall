//
//  TabBarController.m
//  baiyiMall
//
//  Created by Dv_wang on 15-10-6.
//  Copyright (c) 2015年 Dv_wang. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    mainpageViewController *mainpageVC=[[mainpageViewController alloc] init];
    personalViewController *personalVC=[[personalViewController alloc] init];
    UINavigationController *personalNC=[[UINavigationController alloc] initWithRootViewController:personalVC];
    newsViewController *newsVC=[[newsViewController alloc] init];
    moreViewController *moreVC=[[moreViewController alloc] init];
    mainpageVC.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"主页" image:nil tag:0];
    newsVC.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"消息" image:nil tag:1];
    personalNC.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"个人" image:nil tag:2];
    moreVC.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"更多" image:nil tag:3];
    self.viewControllers=[NSArray arrayWithObjects:mainpageVC,newsVC,personalNC,moreVC,nil];
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
