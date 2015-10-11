//
//  myShopViewController.m
//  baiyiMall
//
//  Created by Dv_wang on 15-10-8.
//  Copyright (c) 2015年 Dv_wang. All rights reserved.
//

#import "myShopViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@implementation myShopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    AVUser *user=[AVUser currentUser];
    UILabel *shopNameLb=[[UILabel alloc] initWithFrame:CGRectMake(30,100,100,30)];
    AVObject *myShop=[user objectForKey:@"myShop"];
    shopNameLb.text=[myShop objectForKey:@"shopName"];
    [self.view addSubview:shopNameLb];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
