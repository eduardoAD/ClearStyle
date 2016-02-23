//
//  TableViewCell.h
//  ClearStyle
//
//  Created by Eduardo Alvarado Díaz on 2/11/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"
#import "TableViewCellDelegate.h"
#import "StrikethroughLabel.h"

// A custom table view cell that renders ToDoItem items
@interface TableViewCell : UITableViewCell<UITextFieldDelegate>

// The item that this cell renders
@property (nonatomic) ToDoItem *todoItem;

// The object that acts as delegate for this cell
@property (nonatomic, assign) id<TableViewCellDelegate> delegate;

// The label used to render the to-do next
@property (nonatomic, strong, readonly) StrikethroughLabel *label;

@end
