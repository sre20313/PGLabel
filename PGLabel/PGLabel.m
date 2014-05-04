//
//  PGLabel.m
//  PGLabel
//
//  Created by Masashi Tanaka on 2014/05/03.
//  Copyright (c) 2014年 Masashi Tanaka. All rights reserved.
//

#import "PGLabel.h"

@interface PGLabel ()
{
    NSTimer *_timer;
    int _count;
    double _totalTime;
}
@end

@implementation PGLabel

#pragma  mark - init

- (id)init
{
    self = [super init];

    if (self)
    {
        [self initialize];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];

    if (self)
    {
        [self initialize];
    }

    return self;
}

- (void)initialize
{
    _count = 0;
    _timeInteval = 0.05;
    _prefixString = @"";
    _suffixString = @"";
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                          action:@selector(tap)];
    [self addGestureRecognizer:tapGestureRecognizer];
}

#pragma  mark - action

- (void)start
{
    if (!_timer.isValid)
    {
        _count = 0;
        _timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInteval
                                                  target:self
                                                selector:@selector(time)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

- (void)stop
{
    if (_timer.isValid)
    {
        [_timer invalidate];
    }
}

#pragma  mark -

- (void)tap
{
    [self start];
}

- (void)time
{
    _count++;
    _totalTime += self.timeInteval;

    self.text = [NSString stringWithFormat:@"%@%d%@%@", self.prefixString, _count, @"%", self.suffixString];
    
    if (100 <= _count)
    {
        [self labelDidFinishTimer];
    }
}

- (void)labelDidFinishTimer
{
    [self stop];

    if (self.delegate)
    {
        [self.delegate labelDidFinishTimer:self];
    }
}


@end
