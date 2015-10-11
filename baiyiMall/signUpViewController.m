//
//  signUpViewController.m
//  baiyiMall
//
//  Created by Dv_wang on 15-10-5.
//  Copyright (c) 2015年 Dv_wang. All rights reserved.
//

#import "signUpViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface signUpViewController ()

@end

@implementation signUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    usernameTf=[[UITextField alloc] initWithFrame:CGRectMake(50,100,100,30)];
    usernameTf.borderStyle=UITextBorderStyleRoundedRect;
    [self.view addSubview:usernameTf];
    passwordTf=[[UITextField alloc] initWithFrame:CGRectMake(50,150,100,30)];
    passwordTf.borderStyle=UITextBorderStyleRoundedRect;
    [self.view addSubview:passwordTf];
    emailTf=[[UITextField alloc] initWithFrame:CGRectMake(50,200,100,30)];
    emailTf.borderStyle=UITextBorderStyleRoundedRect;
    [self.view addSubview:emailTf];
    
    UIButton *signUpBtn=[[UIButton alloc] initWithFrame:CGRectMake(50,250,100,30)];
    [signUpBtn setTitle:@"注册" forState:UIControlStateNormal];
    [signUpBtn setBackgroundColor:[UIColor redColor]];
    [signUpBtn addTarget:self action:@selector(signUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signUpBtn];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)signUp:(UIButton *)btn
{
    AVUser *user=[AVUser user];
    user.username=usernameTf.text;
    user.password=passwordTf.text;
    user.email=emailTf.text;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if(succeeded)
         {
//             [user setObject:nil forKey:@"headImage"];
//             [user setObject:nil forKey:@"myShow"];
             NSLog(@"成功注册");
         }
         else
         {
             NSLog(@"%@",usernameTf.text);
         }
     }];
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
