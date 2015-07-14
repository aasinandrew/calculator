//
//  ViewController.m
//  calculator
//
//  Created by Benjamin COOPER on 7/13/15.
//  Copyright (c) 2015 Ben Cooper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property NSString *firstNumber;
@property NSString *secondNumber;
@property BOOL isThereFirstNumber;

@end

int firstNum;
int secondNum;
int result;
NSString *operator;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.firstNumber = @"";
    self.secondNumber = @"";
    self.isThereFirstNumber = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onePressed:(UIButton *)sender {

    if (!self.isThereFirstNumber) {
        NSString *number = sender.titleLabel.text;
        self.firstNumber = [self.firstNumber stringByAppendingString:number];
        self.resultLabel.text = self.firstNumber;
    }
    else {
        NSString *number = sender.titleLabel.text;
        self.secondNumber = [self.secondNumber stringByAppendingString:number];
        self.resultLabel.text = self.secondNumber;
    }


}

- (IBAction)operatorPressed:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"+"]) {
        self.isThereFirstNumber = true;
        firstNum = [self.firstNumber intValue];
        operator = @"+";
    } else if ([sender.titleLabel.text isEqualToString:@"-"]) {
        self.isThereFirstNumber = true;
        firstNum = [self.firstNumber intValue];
        operator = @"-";
    } else if ([sender.titleLabel.text isEqualToString:@"*"]) {
        self.isThereFirstNumber = true;
        firstNum = [self.firstNumber intValue];
        operator = @"*";
    } else if ([sender.titleLabel.text isEqualToString:@"/"]) {
        self.isThereFirstNumber = true;
        firstNum = [self.firstNumber intValue];
        operator = @"/";
    }
}

- (IBAction)onEqualPressed:(UIButton *)sender {
     if ([operator isEqualToString:@"+"]) {
        secondNum = [self.secondNumber intValue];
        result = firstNum + secondNum;
    } else if ([operator isEqualToString:@"-"]) {
        secondNum = [self.secondNumber intValue];
        result = firstNum - secondNum;
    } else if ([operator isEqualToString:@"*"]) {
        secondNum = [self.secondNumber intValue];
        result = firstNum * secondNum;
    } else if ([operator isEqualToString:@"/"]) {
        secondNum = [self.secondNumber intValue];
        result = firstNum / secondNum;
    }
    self.resultLabel.text = [NSString stringWithFormat:@"%i", result];

    self.firstNumber = [NSString stringWithFormat:@"%i", result];
    self.secondNumber = @"";
}

- (IBAction)zeroOnPress:(id)sender {
    self.resultLabel.text = [NSString stringWithFormat:@"0"];
    self.firstNumber = @"";
    self.secondNumber = @"";
    self.isThereFirstNumber = false;
}


@end
