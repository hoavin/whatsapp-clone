//
//  ChatViewController.m
//  WhatsApp
//
//  Created by Kevin Hoàng on 28.12.21.
//

#import "ChatViewController.h"
#import "../../Views/Cells/Chat/ChatTableViewCell.h"
#import "../../Model/ModelData.h"
#import "Conversation/ConversationViewController.h"

@interface ChatViewController ()

@property(nonatomic, strong)UISearchController *searchController;

- (void)configureNavBar;

- (void)configureTableView;

@end

@implementation ChatViewController

- (void)configureNavBar {    
    self.title = @"Chats";
    
    self.navigationController.navigationBar.prefersLargeTitles = YES;
        
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:NULL];
    
    self.searchController = [[UISearchController alloc]init];
    self.navigationItem.searchController = self.searchController;
}

- (void)configureTableView {
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"ChatCell"];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    [self configureNavBar];
    [self configureTableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ModelData.modelData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatTableViewCell *cell = [[ChatTableViewCell alloc]init];
    [cell configureWithContact:ModelData.modelData[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ConversationViewController *controller = [[ConversationViewController alloc]init];
    controller.contact = ModelData.modelData[indexPath.row];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
