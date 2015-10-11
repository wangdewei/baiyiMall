//
//  setMyShopViewController.m
//  baiyiMall
//
//  Created by Dv_wang on 15-10-9.
//  Copyright (c) 2015年 Dv_wang. All rights reserved.
//

#import "setMyShopViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@implementation setMyShopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    myShopNameTF=[[UITextField alloc] initWithFrame:CGRectMake(30,100,100,30)];
    myShopNameTF.borderStyle=UITextBorderStyleRoundedRect;
    [self.view addSubview:myShopNameTF];
    UIButton *didBtn=[[UIButton alloc] initWithFrame:CGRectMake(150,150,30,30)];
    [didBtn setBackgroundColor:[UIColor greenColor]];
    [didBtn addTarget:self action:@selector(setMyShop:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:didBtn];

}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)setMyShop:(UIButton *)btn
{
    AVUser *user=[AVUser currentUser];
    AVObject *myShop=[AVObject objectWithClassName:@"Shop"];
    [myShop setObject:myShopNameTF.text forKey:@"shopName"];
    [myShop saveInBackground];
    [user setObject:myShop forKey:@"myShop"];
}

@end
