//
//  ConversationViewController.m
//  WhatsApp
//
//  Created by Kevin Hoàng on 02.01.22.
//

#import "ConversationViewController.h"
#import "../../../Views/Cells/ChatBubble/ChatBubbleTableViewCell.h"

@interface ConversationViewController ()

- (void)configureNavBar;

- (void)configureToolBar;

- (void)configureTableView;

@end

@implementation ConversationViewController

- (void)configureNavBar {
    self.navigationController.navigationBar.topItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    
    UIBarButtonItem *videoCallButton = [[UIBarButtonItem alloc]initWithImage:[UIImage systemImageNamed:@"video"] style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *callButton = [[UIBarButtonItem alloc]initWithImage:[UIImage systemImageNamed:@"phone"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItems = @[callButton, videoCallButton];
    
}

- (void)configureToolBar {
    [self.navigationController setToolbarHidden:NO animated:YES];
    UITextField *textField = [[UITextField alloc]init];
    textField.backgroundColor = [UIColor systemBackgroundColor];
    textField.layer.borderWidth = 1;
    textField.layer.borderColor = [UIColor systemFillColor].CGColor;
    textField.layer.masksToBounds = NO;
    textField.layer.cornerRadius = 15;
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    [textField.widthAnchor constraintEqualToConstant:250].active = YES;
    [textField.heightAnchor constraintEqualToConstant:30].active = YES;
    UIBarButtonItem *textFieldItem = [[UIBarButtonItem alloc]initWithCustomView:textField];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd menu:nil];
    
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc]initWithImage:[UIImage systemImageNamed:@"camera"] menu:nil];
 
    UIBarButtonItem *microphoneButton = [[UIBarButtonItem alloc]initWithImage:[UIImage systemImageNamed:@"mic"] menu:nil];

    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace menu:nil];
    
    self.toolbarItems = @[addButton, textFieldItem, flexibleSpace, cameraButton, microphoneButton];
    
}

- (void)configureTableView {
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"MessageBubbleCell"];
    self.tableView.separatorColor = [UIColor clearColor];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.contact.messages.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:NO];    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureNavBar];
    [self configureToolBar];
    [self configureTableView];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
    [self.navigationController setToolbarHidden:YES];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contact.messages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatBubbleTableViewCell *cell = [[ChatBubbleTableViewCell alloc]init];
    [cell configureWithMessage:self.contact.messages[indexPath.row]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
