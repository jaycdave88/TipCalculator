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

float globalX = NO;
int people = 0;

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

- (IBAction)valueChange:(id)sender {
    NSString *currentTipString = [[NSString alloc] initWithFormat:@"%1.2f%%",[_slider value]*100];

    [_currentTipLabel setText:currentTipString];
}


- (IBAction)splitPeopleAction:(id)sender {



    NSString *userInput = [_textField text];
    float billAmount = [userInput floatValue];
    _splitPeople.selectedSegmentIndex = 7;


    
    if(_splitPeople.selectedSegmentIndex == 0){
        globalX = billAmount / 2;
        people = 2;
    }else if (_splitPeople.selectedSegmentIndex == 1){
        globalX = billAmount / 3;
        people = 3;
    }else if (_splitPeople.selectedSegmentIndex == 2){
        globalX = billAmount / 4;
        people = 4;
    }else if (_splitPeople.selectedSegmentIndex == 3){
        globalX = billAmount / 5;
        people = 5;
    }

}

- (IBAction)buttonPressed:(id)sender {
    NSString *userInput = [_textField text];

    if ([userInput length] == 0) {
        UIAlertView *alertView =  [[UIAlertView alloc] initWithTitle:@"Tip Amount" message:@"Oops! Looks like you forgot to type in a Bill Total!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    } else {
        float billAmount = [userInput floatValue];
        float tipAmount = [_slider value]* billAmount;

        float totalPerPerson = tipAmount / people;
        float perPersonTotal = totalPerPerson + globalX ;

        NSString *tipString = [[NSString alloc] initWithFormat:@"$%1.2f",tipAmount];
        [_label setText:tipString];

        float totalBill = billAmount + tipAmount;
        NSString *tb = [[NSString alloc] initWithFormat:@"$%1.2f", totalBill];
        [_totalBillLabel setText:tb];

        if (_switchOutlet.on) {
            NSString *split = [[NSString alloc] initWithFormat:@"$%1.2f", perPersonTotal];
            [_splitLable setText:split];
        }else{
            [_splitLable setText:@"$0.00"];
        }

        }// end outter elseb
}//end button pressed

- (IBAction)switch:(id)sender {
    if (_switchOutlet.on){
        (_splitPeople.hidden = NO);
    }else{
        _splitPeople.hidden = YES;

    }
}



@end
