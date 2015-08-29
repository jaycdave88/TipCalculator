//
//  ViewController.h
//  TipCalc
//
//  Created by DEV MODE on 7/21/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipCalculatorViewController : UIViewController <UITextFieldDelegate>


@property (nonatomic , weak) IBOutlet UITextField*    txtfReciptAmount;
@property (nonatomic , weak) IBOutlet UISlider*       sliderTipPercentage;
@property (nonatomic , weak) IBOutlet UILabel*        lblTipValueInDollars;
@property (nonatomic , weak) IBOutlet UILabel*        lblTipValueInPercentage;
@property (nonatomic , weak) IBOutlet UILabel*        lblTotalAmountWithTip;
@property (nonatomic , weak) IBOutlet UILabel*        lblContributionPerHead;
@property (nonatomic , weak) IBOutlet UISwitch*       switchMultipleContributors;
@property (nonatomic , weak) IBOutlet UIStepper*      stepperNumberOfContributors;
@property (nonatomic , weak) IBOutlet UILabel*        lblMaxContributors;
@property (nonatomic , weak) IBOutlet UIView*         viewContributors;
@property (nonatomic , weak) IBOutlet UIView*         viewBottomPanel;
@property (nonatomic , weak) IBOutlet NSLayoutConstraint* constraintStepperViewHeight;

- (IBAction)btnCalculateTipPressed:(id)sender;
- (IBAction)switchSplitBillToggled:(id)sender;
- (IBAction)sliderTipFractionalValueChanged:(id)sender;
- (IBAction)stepperValueChanged:(id)sender;

@end