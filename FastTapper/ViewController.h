//
//  ViewController.h
//  FastTapper
//
//  Created by DetroitLabs on 5/23/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *tapCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *countDownLabel;

@property(nonatomic) int tapCounter;
@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic) int seconds;

@property(strong, nonatomic) NSMutableArray *topScores;

- (IBAction)buttonPressed;
- (IBAction)startButton;

@end

