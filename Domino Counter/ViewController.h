//
//  ViewController.h
//  Domino Counter
//
//  Created by Kai Schaller on 1/2/15.
//  Copyright (c) 2015 Kai Schaller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

- (IBAction)dominoButtonTapped:(id)sender;

@end

