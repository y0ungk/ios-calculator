//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Young Kim on 1/20/13.
//  Copyright (c) 2013 young.kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;
- (void)clearStack;

@end
