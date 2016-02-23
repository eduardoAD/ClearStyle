//
//  TableViewDataSource.h
//  ClearStyle
//
//  Created by Eduardo Alvarado Díaz on 2/12/16.
//  Copyright © 2016 personal. All rights reserved.
//

// The TableViewDataSource is adopted by a class that is a source of data
// for a TableView
@protocol TableViewDataSource <NSObject>

// indicates the number of rows in the table
- (NSInteger)numberOfRows;

// obtain the cell for the given row
- (UIView*)cellForRow:(NSInteger)row;

// Informs the datasource that a new item has benn added at the top of the table
- (void)itemAdded;

// Informs the datasource that a new item has been added at the given index
-(void) itemAddedAtIndex:(NSInteger)index;

@end
