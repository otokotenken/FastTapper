//
//  ViewController.m
//  FastTapper
//
//  Created by DetroitLabs on 5/23/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _topScores = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startGame {
    _tapCounter = 0;
    _seconds =5;
    _tapCountLabel.text = [NSString stringWithFormat: @"Tap Count: %i", _tapCounter];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];
}

-(void)subtractTime {
    _seconds--;
     _countDownLabel.text = [NSString stringWithFormat:@"%i", _seconds];
    
    if (_seconds ==0){
        [_timer invalidate];
        [self determineWinOrLose];
        NSNumber *scoreToAdd = [NSNumber numberWithInt:_tapCounter];
        [_topScores addObject:scoreToAdd];
        NSLog(@"Array: %@", _topScores);
    }
}
- (void)determineWinOrLose {
    if (_tapCounter>= 100){
        NSLog(@"You Win %i", _tapCounter);
        [self gameNotification:@"You Win"];
    } else {
        NSLog(@"You Lose %i", _tapCounter);
        [self gameNotification:@"You Lose"];
    }
    
}
-(void)gameNotification:(NSString *)messageTitle {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:messageTitle
                                                                   message:[NSString stringWithFormat:@"Your Tap Count: %i.", _tapCounter]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}
- (IBAction)startButton {
    [self startGame];
    NSLog(@"startbutton is working");
}
- (IBAction)buttonPressed {
    NSLog(@"Button is working");
    _tapCounter++;
    NSLog(@"%i", _tapCounter);
    _tapCountLabel.text = [NSString stringWithFormat: @"Tap Count: %i", _tapCounter];
}


@end
