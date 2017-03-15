//
//  ViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/2/25.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
typedef id (*_IMP) (id,SEL,...);

@interface ViewController ()

@end

@implementation ViewController

-(void)load{
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken, ^{
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
