//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Young Kim on 1/13/13.
//  Copyright (c) 2013 young.kim. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize brainDisplay = _brainDisplay;
@synthesize brain = _brain;

- (CalculatorBrain *)brain {
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(id)sender {
    NSString *digit = [sender currentTitle];
    NSLog(@"digit pressed = %@", digit);
    if (self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}

- (IBAction)operationPressed:(UIButton *)sender {
    if (self.userIsInTheMiddleOfEnteringANumber) [self enterPressed];    
    self.brainDisplay.text = [self.brainDisplay.text stringByAppendingString:sender.currentTitle];
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
    if ([@"π" isEqualToString:sender.currentTitle]) [self enterPressed];
}

- (IBAction)enterPressed {
    self.brainDisplay.text = [self.brainDisplay.text stringByAppendingString:self.display.text];
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)decimalPointPressed {
    NSRange decimalFound = [self.display.text rangeOfString:@"."];
    if (decimalFound.location == NSNotFound) {
        self.display.text = [self.display.text stringByAppendingString:@"."];
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}

- (IBAction)clearPressed {
    [self.brain clearStack];
    self.display.text = @"0";
    self.brainDisplay.text = @"";
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
