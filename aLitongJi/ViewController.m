//
//  ViewController.m
//  aLitongJi
//
//  Created by kuanter on 2017/4/26.
//  Copyright © 2017年 kuanter. All rights reserved.
//

#import "ViewController.h"
#import "UMMobClick/MobClick.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)Forward:(id)sender {
    NSLog(@"====%s=====%d=====",__func__,__LINE__);
    [MobClick event:@"lianJieCount"];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
