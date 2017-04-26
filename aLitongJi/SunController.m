//
//  SunController.m
//  aLitongJi
//
//  Created by kuanter on 2017/4/26.
//  Copyright © 2017年 kuanter. All rights reserved.
//

#import "SunController.h"
#import "UMMobClick/MobClick.h"
#import "PayAlertView.h"
@interface SunController ()

@end

@implementation SunController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //PayAlertView 这个类和友盟统计没有什么关系
    
    PayAlertView*payV=[[PayAlertView alloc] initWithNSDictionary:nil];
    
    [payV showWithCompletion:^(NSInteger selectIndex) {
        NSLog(@"====%s=====%ld=====",__func__,(long)selectIndex);
    }];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"孙某"];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"孙某"];
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
