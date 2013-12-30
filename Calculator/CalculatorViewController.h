//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Young Kim on 1/13/13.
//  Copyright (c) 2013 young.kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;

@property (weak, nonatomic) IBOutlet UIButton *digitPressed;

@property (weak, nonatomic) IBOutlet UILabel *brainDisplay;

@end
