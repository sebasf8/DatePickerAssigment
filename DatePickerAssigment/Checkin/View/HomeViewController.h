//
//  HomeViewController.h
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 9/10/24.
//

#import <UIKit/UIKit.h>
#import "HomeViewObjcView.h"

@protocol CheckinCoordinatorProtocol;
@protocol CompanyProvider;

@interface HomeViewController : UIViewController

@property (nonatomic, strong) id<CheckinCoordinatorProtocol> coordinator;
@property (nonatomic, strong) id<CompanyProvider> companyService;
@property (nonatomic, strong) HomeViewObjcView *homeView;

- (instancetype)initWithCoordinator:(id<CheckinCoordinatorProtocol>)coordinator companyService:(id<CompanyProvider>)companyService;

@end
