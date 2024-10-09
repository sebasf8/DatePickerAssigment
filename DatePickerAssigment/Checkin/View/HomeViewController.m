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
        self.homeView = [[HomeViewObjcView alloc] init];
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
    self.view = self.homeView;
}

#pragma mark - Private Methods

- (void)load {
    NSString *companyName = [self.companyService fetchCompany].name;

    self.homeView.companyLabel.text = [NSString stringWithFormat:@"Welcome to Checkin app, an %@ product.", companyName];
}

- (void)setupActions {
    [self.homeView.startButton addTarget:self
                                  action:@selector(startButtonTapped)
                        forControlEvents:UIControlEventTouchUpInside];
}

- (void)startButtonTapped {
    [self.coordinator navigateToDateSelection];
}

@end
