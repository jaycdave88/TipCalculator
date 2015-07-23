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

    //thundercars hoooo
    [_label setText:@"$0.00"];
    //dissmiss keyboard start
    self.textField.delegate = self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    if (textField) {
        [textField resignFirstResponder];
    }

    return NO;
}
// dissmiss keyboard end

- (IBAction)buttonPressed:(id)sender {
   NSString *userInput = [_textField text];

    if ([userInput length] == 0) {
        UIAlertView *alertView =  [[UIAlertView alloc] initWithTitle:@"Tip Amount" message:@"Oops! Looks like you forgot to type in a Bill Total!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    } else {
        float billAmount = [userInput floatValue];
        float tipAmount = [_slider value]* billAmount;

        NSString *tipString = [[NSString alloc] initWithFormat:@"$%1.2f",tipAmount];
        [_label setText:tipString];

       float totalBill = billAmount + tipAmount;
        NSString *tb = [[NSString alloc] initWithFormat:@"$%1.2f", totalBill];
        [_totalBillLabel setText:tb];
    }

    
}
- (IBAction)valueChange:(id)sender {
    NSString *currentTipString = [[NSString alloc] initWithFormat:@"%1.2f%%",[_slider value]*100];

    [_currentTipLabel setText:currentTipString];
     
}

@end
