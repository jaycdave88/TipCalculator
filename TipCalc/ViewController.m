//
//  ViewController.m
//  TipCalc
//
//  Created by DEV MODE on 7/21/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // roll out
    [_label setText:@"hi"];
}


- (IBAction)buttonPressed:(id)sender {
    NSString *userInput;

   userInput = [_textField text];

    [_label setText:userInput];
}
@end
