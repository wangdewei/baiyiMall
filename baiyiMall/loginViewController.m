//
//  loginViewController.m
//  baiyiMall
//
//  Created by Dv_wang on 15-10-5.
//  Copyright (c) 2015年 Dv_wang. All rights reserved.
//

#import "loginViewController.h"
#import "signUpViewController.h"
#import "TabBarController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *userNameLab=[[UILabel alloc] initWithFrame:CGRectMake(50,100,100,30)];
    UILabel *passwordLab=[[UILabel alloc] initWithFrame:CGRectMake(50,200,100,30)];
    userNameLab.text=@"userName";
    passwordLab.text=@"password";
    [self.view addSubview:userNameLab];
    [self.view addSubview:passwordLab];
    
    usernameTf=[[UITextField alloc] initWithFrame:CGRectMake(50,150,100,30)];
    passwordTf=[[UITextField alloc] initWithFrame:CGRectMake(50,250,100,30)];
    usernameTf.borderStyle=UITextBorderStyleRoundedRect;
    passwordTf.borderStyle=UITextBorderStyleRoundedRect;
    [self.view addSubview:usernameTf];
    [self.view addSubview:passwordTf];
    
    UIButton *loginBtn=[[UIButton alloc] initWithFrame:CGRectMake(50,300,100,30)];
    UIButton *signUpBtn=[[UIButton alloc] initWithFrame:CGRectMake(150,300,100,30)];
    [loginBtn setBackgroundColor:[UIColor redColor]];
    [signUpBtn setBackgroundColor:[UIColor greenColor]];
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [signUpBtn setTitle:@"注册" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [signUpBtn addTarget:self action:@selector(pushToSignUpVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    [self.view addSubview:signUpBtn];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)login:(UIButton *)btn
{
    [AVUser logInWithUsernameInBackground:usernameTf.text password:passwordTf.text block:^(AVUser *user,NSError *error)
     {
         if(user)
         {
             NSLog(@"%@",user.username);
             TabBarController *tabBarController=[[TabBarController alloc] init];
             [self presentViewController:tabBarController animated:YES completion:^{}];
         }
     }];
}

- (void)pushToSignUpVC:(UIButton *)btn
{
    signUpViewController *signUpVC=[[signUpViewController alloc] init];
    [self.navigationController pushViewController:signUpVC animated:YES];
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
