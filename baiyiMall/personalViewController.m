//
//  personalViewController.m
//  baiyiMall
//
//  Created by Dv_wang on 15-10-5.
//  Copyright (c) 2015年 Dv_wang. All rights reserved.
//

#import "personalViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface personalViewController ()

@end

@implementation personalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AVUser *user=[AVUser currentUser];
    
    UIImageView *topPictureView=[[UIImageView alloc] initWithFrame:CGRectMake(0,0,SCREEN_WIDTH,SCREEN_WIDTH*0.65)];
    topPictureView.image=[UIImage imageNamed:@"顶端图片.jpg"];
    [self.view addSubview:topPictureView];
    
    UIImageView *headImageView=[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-SCREEN_WIDTH*0.1,SCREEN_WIDTH*0.65/2-SCREEN_WIDTH*0.1,SCREEN_WIDTH*0.2,SCREEN_WIDTH*0.2)];
    [headImageView setBackgroundColor:[UIColor redColor]];
    headImageView.layer.masksToBounds=YES;
    headImageView.layer.cornerRadius=SCREEN_WIDTH*0.1;
    [self.view addSubview:headImageView];
    AVFile *headImageFile=[user objectForKey:@"headImage"];
    NSData *headImageData=[headImageFile getData];
    UIImage *headImage=[[UIImage alloc] initWithData:headImageData];
    if(headImage==nil)
    {
        headImageView.image=[UIImage imageNamed:@"默认头像.jpg"];
    }
    else
    {
        headImageView.image=headImage;
    }
    UITapGestureRecognizer *touchHeadImage=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchHeadImage:)];
    headImageView.userInteractionEnabled=YES;
    [headImageView addGestureRecognizer:touchHeadImage];
    
    UILabel *usernameLb=[[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50,SCREEN_WIDTH*0.65*0.7,100,30)];
    usernameLb.textAlignment=NSTextAlignmentCenter;
    usernameLb.text=user.username;
    [self.view addSubview:usernameLb];
    
    UIButton *myShopBtn=[[UIButton alloc] initWithFrame:CGRectMake(20,230,50,50)];
    [myShopBtn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:myShopBtn];
    
    UIButton *followShopBtn=[[UIButton alloc] initWithFrame:CGRectMake(80,230,50,50)];
    [followShopBtn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:followShopBtn];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchHeadImage:(UITapGestureRecognizer *)tgr
{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"确定要修改头像？" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",@"取消", nil];
    [alert show];
}

#pragma marks --UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
        NSLog(@"确定");
    }
    else if(buttonIndex==1)
    {
        NSLog(@"取消");
    }
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
