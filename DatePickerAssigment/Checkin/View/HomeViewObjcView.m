//
//  HomeView.m
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "HomeViewObjcView.h"


@implementation HomeViewObjcView

- (instancetype)init {
    self = [super initWithFrame:CGRectZero];

    if (self) {
        [self configureView];
    }

    return self;
}

- (void)configureView {
    [self addSubview:self.startButton];
    [self addSubview:self.companyLabel];
    [self configureConstraints];
}

- (void)configureConstraints {
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.companyLabel.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[
        [self.startButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.startButton.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.companyLabel.widthAnchor constraintEqualToConstant:200],
        [self.companyLabel.heightAnchor constraintEqualToConstant:50],
        [self.companyLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.companyLabel.bottomAnchor constraintEqualToAnchor:self.startButton.topAnchor constant:-40],
    ]];
}

- (UIButton *)startButton {
    if (!_startButton) {
        _startButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_startButton setTitle:@"Start" forState:UIControlStateNormal];
    }

    return _startButton;
}

- (UILabel *)companyLabel {
    if (!_companyLabel) {
        _companyLabel = [[UILabel alloc] init];
        _companyLabel.text = @"Company";
        _companyLabel.textColor = [UIColor whiteColor];
        _companyLabel.textAlignment = NSTextAlignmentCenter;
        _companyLabel.numberOfLines = 0;
        [_companyLabel sizeToFit];
    }

    return _companyLabel;
}

@end
