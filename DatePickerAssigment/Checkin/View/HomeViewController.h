//
//  HomeViewController.h
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 9/10/24.
//

#import <UIKit/UIKit.h>

@protocol CheckinCoordinatorProtocol;
@protocol CompanyProvider;

@interface HomeViewController : UIViewController

@property (nonatomic, strong) id<CheckinCoordinatorProtocol> coordinator;
@property (nonatomic, strong) id<CompanyProvider> companyService;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UILabel *companyLabel;

- (instancetype)initWithCoordinator:(id<CheckinCoordinatorProtocol>)coordinator companyService:(id<CompanyProvider>)companyService;

@end
