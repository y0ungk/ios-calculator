//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Young Kim on 1/20/13.
//  Copyright (c) 2013 young.kim. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()

@property (nonatomic, strong) NSMutableArray *operandStack;

@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *) operandStack
{
    if (_operandStack == nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

- (void) setOperandStack:(NSMutableArray *)operandStack {
    _operandStack = operandStack;
}

- (void)pushOperand:(double)operand {
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)popOperand {
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject)[self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

- (double)performOperation:(NSString *)operation {
    double result = 0;
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if ([@"*" isEqualToString:operation]) {
        result = [self popOperand] * [self popOperand];
    } else if ([@"/" isEqualToString:operation]) {
        double dividend = [self popOperand];
        double divisor = [self popOperand];
        result = (divisor != 0) ? dividend / divisor : 0;
    } else if ([@"-" isEqualToString:operation]) {
        result = - [self popOperand] + [self popOperand];
    } else if ([@"sin" isEqualToString:operation]) {
        result = sin([self popOperand]);
    } else if ([@"cos" isEqualToString:operation]) {
        result = cos([self popOperand]);
    } else if ([@"sqrt" isEqualToString:operation]) {
        result = sqrt([self popOperand]);
    } else if ([@"π" isEqualToString:operation]) {
        result = 3.14;
    }
    return result;
}

- (void)clearStack {
    self.operandStack = nil;
}

@end
