//
//  SettingsViewController.m
//  WhatsApp
//
//  Created by Kevin Hoàng on 28.12.21.
//

#import "SettingsViewController.h"
#import "../../Views/Cells/Settings/SettingsTableViewCell.h"
#import "../../Views/Cells/Settings/ProfileTableViewCell.h"
#import "../../Model/Profile/Profile.h"

@interface SettingsViewController ()

@property (nonatomic, strong) NSSet *cellIDs;

- (void)configureNavBar;

- (void)configureTableView;

- (ProfileTableViewCell *)dequeueProfileCell;

- (UITableViewCell *)dequeueForSection1:(NSInteger)row;

- (UITableViewCell *)dequeueForSection2:(NSInteger)row;

- (UITableViewCell *)dequeueForSection3:(NSInteger)row;

@end

@implementation SettingsViewController

- (void)configureNavBar {
    self.title = @"Settings";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}

- (void)configureTableView {
    NSArray<NSString *> *ids = @[@"ProfileCell", @"SettingsListCell"];
    self.cellIDs = [[NSSet alloc]initWithArray:ids];
    
    for(NSString *cellId in self.cellIDs) {
        [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellId];
    }
    
    self.tableView.allowsSelection = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureNavBar];
    [self configureTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 4;
            break;
        case 3:
            return 2;
            break;
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    switch (section) {
        case 0:
            return 75;
            break;
            
        default:
            return 44;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    switch (section) {
        case 0:
            return [self dequeueProfileCell];
            break;
        case 1:
            return [self dequeueForSection1:row];
        case 2:
            return [self dequeueForSection2:row];
            break;
        default:
            return [self dequeueForSection3:row];
            break;
    }
}

- (ProfileTableViewCell *)dequeueProfileCell {
    Profile *profile = [Profile sampleProfile];
    ProfileTableViewCell *cell = ProfileTableViewCell.new;
    [cell configureWithProfile:profile];
    return cell;
}

- (UITableViewCell *)dequeueForSection1:(NSInteger)row {
    SettingsTableViewCell *cell = [[SettingsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingsListCell"];
    UIImage *image = [UIImage alloc];
    switch (row) {
        case 0:
            image = [UIImage systemImageNamed:@"star.fill"];
            [cell configureWithTitle:@"Starred Messages" withImage:image];
            return cell;
            break;
        case 1:
            image = [UIImage systemImageNamed:@"laptopcomputer"];
            [cell configureWithTitle:@"Linked Devices" withImage:image];
            return cell;
            break;
        default:
            return UITableViewCell.new;
            break;
    }
}

- (UITableViewCell *)dequeueForSection2:(NSInteger)row {
    SettingsTableViewCell *cell = [[SettingsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingsListCell"];
    UIImage *image = [UIImage alloc];
    switch (row) {
        case 0:
            image = [UIImage systemImageNamed:@"key.fill"];
            [cell configureWithTitle:@"Account" withImage:image];
            return cell;
            break;
        case 1:
            image = [UIImage systemImageNamed:@"message.fill"];
            [cell configureWithTitle:@"Chats" withImage:image];
            return cell;
            break;
        case 2:
            image = [UIImage systemImageNamed:@"bell.fill"];
            [cell configureWithTitle:@"Notifications" withImage:image];
            return cell;
            break;
        case 3:
            image = [UIImage systemImageNamed:@"arrow.up.arrow.down"];
            [cell configureWithTitle:@"Storage and Data" withImage:image];
            return cell;
            break;
        default:
            return UITableViewCell.new;
            break;
    }
}

- (UITableViewCell *)dequeueForSection3:(NSInteger)row {
    SettingsTableViewCell *cell = [[SettingsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingsListCell"];
    UIImage *image = [UIImage alloc];
    switch (row) {
        case 0:
            image = [UIImage systemImageNamed:@"info"];
            [cell configureWithTitle:@"Help" withImage:image];
            return cell;
            break;
        case 1:
            image = [UIImage systemImageNamed:@"heart.fill"];
            [cell configureWithTitle:@"Tell a Friend" withImage:image];
            return cell;
            break;
        default:
            return UITableViewCell.new;
            break;
    }
}

@end
