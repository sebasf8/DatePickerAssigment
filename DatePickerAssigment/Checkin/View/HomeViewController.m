//
//  HomeObjcViewController.m
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 9/10/24.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "DatePickerAssigment-Swift.h"

@implementation HomeViewController

- (instancetype)initWithCoordinator:(id<CheckinCoordinatorProtocol>)coordinator companyService:(id<CompanyProvider>)companyService {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.coordinator = coordinator;
        self.companyService = companyService;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    [NSException raise:NSInternalInconsistencyException
                format:@"init(coder:) has not been implemented"];
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupActions];
    [self load];
}

- (void)loadView {
    [self configureView];
}

- (void)load {
    NSString *companyName = [self.companyService fetchCompany].name;

    self.companyLabel.text = [NSString stringWithFormat:@"Welcome to Checkin app, an %@ product.", companyName];
}

- (void)setupActions {
    [self.startButton addTarget:self
                                  action:@selector(startButtonTapped)
                        forControlEvents:UIControlEventTouchUpInside];
}

- (void)startButtonTapped {
    [self.coordinator navigateToDateSelection];
}

- (void)configureView {
    self.view = [[UIView alloc] init];
    [self.view addSubview:self.startButton];
    [self.view addSubview:self.companyLabel];
    [self configureConstraints];
}

- (void)configureConstraints {
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.companyLabel.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[
        [self.startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.startButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [self.companyLabel.widthAnchor constraintEqualToConstant:200],
        [self.companyLabel.heightAnchor constraintEqualToConstant:50],
        [self.companyLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
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
        _companyLabel.textColor = [UIColor whiteColor];
        _companyLabel.textAlignment = NSTextAlignmentCenter;
        _companyLabel.numberOfLines = 0;
        [_companyLabel sizeToFit];
    }

    return _companyLabel;
}
@end
