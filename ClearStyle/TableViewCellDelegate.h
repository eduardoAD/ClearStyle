//
//  TableViewCellDelegate.h
//  ClearStyle
//
//  Created by Eduardo Alvarado Díaz on 2/11/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import "ToDoItem.h"

@class TableViewCell;

// A protocol that the TableViewCell uses to inform of state change
@protocol TableViewCellDelegate <NSObject>

// indicates that the given item has been deleted
- (void)toDoItemDeleted:(ToDoItem*)todoItem;

// Indicates that the edit process has begun for the given cell
- (void)cellDidBeginEditing:(TableViewCell*)cell;

// Indicates that the edit process has committed for the given cell
- (void)cellDidEndEditing:(TableViewCell*)cell;

@end
