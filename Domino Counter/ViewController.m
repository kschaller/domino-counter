//
//  ViewController.m
//  Domino Counter
//
//  Created by Kai Schaller on 1/2/15.
//  Copyright (c) 2015 Kai Schaller. All rights reserved.
//

#import "ViewController.h"
#import "DieButton.h"

@interface ViewController ()

@property NSInteger total;

@end

@implementation ViewController

- (void)dominoButtonTapped:(id)sender {
    UIButton *dominoButton = (UIButton *)sender;
    NSInteger value = dominoButton.tag;
    self.total += value;
    [self updateTotalLabel];
}

- (void)updateTotalLabel {
    self.totalLabel.text = [NSString stringWithFormat:@"%zi", self.total];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Initialize the total to 0.
    self.total = 0;
    [self updateTotalLabel];
}

@end
