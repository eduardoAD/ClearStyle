//
//  TableView.h
//  ClearStyle
//
//  Created by Eduardo Alvarado Díaz on 2/12/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewDataSource.h"

#define SHC_ROW_HEIGHT 50.0f

@interface TableView : UIView <UIScrollViewDelegate>

// the object that acts as the data source for this table
@property (nonatomic, assign) id<TableViewDataSource> dataSource;

// the UIScrollView that hosts the table contents
@property (nonatomic, assign, readonly) UIScrollView* scrollView;

@property (nonatomic, assign) id<UIScrollViewDelegate> delegate;

// dequeues a cell that can be reused
- (UIView*)dequeueReusableCell;

// registers a class for use as new cells
- (void)registerClassForCells:(Class)cellClass;

// an array of cells that are currently visible, sorted from top to bottom.
- (NSArray*)visibleCells;

// forces the table to dispose of all the cells and re-build the table.
- (void)reloadData;

@end
