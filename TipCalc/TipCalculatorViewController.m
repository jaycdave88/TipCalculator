//
//  ViewController.m
//  TipCalc
//
//  Created by DEV MODE on 7/21/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import "TipCalculatorViewController.h"

@interface TipCalculatorViewController ()

@property (nonatomic , assign) BOOL shouldSplitBill;

@end


@implementation TipCalculatorViewController

// Private iVars
@synthesize shouldSplitBill;

@synthesize txtfReciptAmount;
@synthesize sliderTipPercentage;
@synthesize lblTipValueInDollars;
@synthesize lblTipValueInPercentage;
@synthesize lblTotalAmountWithTip;
@synthesize lblContributionPerHead;
@synthesize switchMultipleContributors;
@synthesize stepperNumberOfContributors;
@synthesize lblMaxContributors;
@synthesize viewContributors;
@synthesize constraintStepperViewHeight;
@synthesize viewBottomPanel;
#pragma mark - View Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [constraintStepperViewHeight setConstant:0];
    [stepperNumberOfContributors setMinimumValue:1];
    [stepperNumberOfContributors setMaximumValue:100];
    [stepperNumberOfContributors setValue:1];
    [lblMaxContributors setText:[NSString stringWithFormat:@"%.0f",stepperNumberOfContributors.value]];
    [viewContributors setBackgroundColor:[UIColor clearColor]];
    [viewBottomPanel setBackgroundColor:[UIColor clearColor]];
    [viewContributors setHidden:YES];
    [lblMaxContributors setTextAlignment:NSTextAlignmentLeft];
    [txtfReciptAmount setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.f]];
}

#pragma mark - UITouch Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate Method

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField) {
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark - IBAction Methods

- (IBAction)btnCalculateTipPressed:(id)sender {

    NSString* strReceiptAmount = [self.txtfReciptAmount text];

    if ( strReceiptAmount == nil || [strReceiptAmount length] == 0) {
        UIAlertController* errorPrompt = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Tip Amount", @"Tip Amount")
                                                                             message:NSLocalizedString(@"Oops! Looks like you forgot to type in a Bill Total!", nil)
                                                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK",nil)
                                                           style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

                                                           }];
        [errorPrompt addAction:okAction];
        [self presentViewController:errorPrompt animated:YES completion:NULL];

    }
    else {
        [self performTipCalculations];
    }
}

- (IBAction)stepperValueChanged:(id)sender {
    [self reset];
    UIStepper* stepper = (UIStepper*)sender;
    [lblMaxContributors setText:[NSString stringWithFormat:@"%.0f",stepper.value]];
    [self performTipCalculations];
}

- (IBAction)switchSplitBillToggled:(id)sender {
    [self reset];
    [self.viewContributors setHidden:![sender isOn]];
    shouldSplitBill = [sender isOn];
    [constraintStepperViewHeight setConstant:[sender isOn] ? 50 : 0];
    [UIView animateWithDuration:0.33f animations:^{
            [self.view layoutIfNeeded];
    }];
    [self performTipCalculations];
}

- (IBAction)sliderTipFractionalValueChanged:(id)sender {
    [self reset];
    [lblTipValueInPercentage setText:[NSString stringWithFormat:@"%.0f%%", (100 * [sliderTipPercentage value])]];
    [self performTipCalculations];
}

#pragma mark - User Defined function

- (void)reset {
    // First Reset all iVars

}

- (void)performTipCalculations {

    // Bring all functionality to calculate Tip and Total Value

    NSInteger numberOfParticipants = [stepperNumberOfContributors value];

    float billAmount = [[txtfReciptAmount text] floatValue];

    NSString* truncatedTipMultiplier = [NSString stringWithFormat:@"%.2f",[sliderTipPercentage value]];

    float totalBillAmount =  (1.0f +[truncatedTipMultiplier floatValue]) * billAmount;

    float contributionPerHead = totalBillAmount / numberOfParticipants;

    [lblTipValueInDollars setText:[NSString stringWithFormat:@"$%.2f",(totalBillAmount - billAmount)]];
    [lblTotalAmountWithTip setText:[NSString stringWithFormat:@"$%.2f",totalBillAmount]];
    if (shouldSplitBill) {
        [lblContributionPerHead setText:[NSString stringWithFormat:@"$%.2f",contributionPerHead]];
    }
    else {
        [lblContributionPerHead setText:@"$0.00"];
    }
    
}

@end