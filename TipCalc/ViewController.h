//
//  ViewController.h
//  TipCalc
//
//  Created by DEV MODE on 7/21/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)buttonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

