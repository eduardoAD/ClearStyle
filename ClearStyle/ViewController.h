//
//  ViewController.h
//  ClearStyle
//
//  Created by Eduardo Alvarado Díaz on 2/11/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCellDelegate.h"
#import "TableView.h"

@interface ViewController : UIViewController <TableViewCellDelegate, TableViewDataSource>

@property (strong, nonatomic) IBOutlet TableView *tableView;

@end

