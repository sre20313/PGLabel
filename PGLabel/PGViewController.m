//
//  PGViewController.m
//  PGLabel
//
//  Created by Masashi Tanaka on 2014/05/05.
//  Copyright (c) 2014年 Masashi Tanaka. All rights reserved.
//

#import "PGViewController.h"
#import "PGLabel.h"

@interface PGViewController ()
<
    PGLabelDelegate
>
{
    IBOutlet PGLabel *_label;
}
@end

@implementation PGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _label.delegate = self;
    _label.text = @"start";
}

#pragma mark - TMLabel delegate

- (void)labelDidFinishTimer:(PGLabel *)label
{
    _label.text = @"finish";
    NSLog(@"finish");
}

@end
