//
//  ViewController.m
//  ClearStyle
//
//  Created by Eduardo Alvarado Díaz on 2/11/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import "ViewController.h"
#import "ToDoItem.h"
#import "TableViewCell.h"
#import "TableViewDragAddNew.h"
#import "TableViewPinchToAdd.h"

@implementation ViewController {
    // an array of to-do items
    NSMutableArray* _toDoItems;
    // the offset applied to cells when entering “edit mode”
    float _editingOffset;
    TableViewDragAddNew* _dragAddNew;
    TableViewPinchToAdd* _pinchAddNew;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor blackColor];
    [self.tableView registerClassForCells:[TableViewCell class]];
    _dragAddNew = [[TableViewDragAddNew alloc] initWithTableView:self.tableView];
    _pinchAddNew = [[TableViewPinchToAdd alloc] initWithTableView:self.tableView];

    _toDoItems= [[NSMutableArray alloc] init];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Feed the cat"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Buy eggs"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Pack bags for WWDC"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Rule the web"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Buy a new iPhone"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Find missing socks"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Write a new tutorial"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Master Objective-C"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Remember your wedding anniversary!"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Drink less beer"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Learn to draw"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Take the car to the garage"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Sell things on eBay"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Learn to juggle"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"Give up"]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIColor*)colorForIndex:(NSInteger) index {
    NSUInteger itemCount = _toDoItems.count - 1;
    float val = ((float)index / (float)itemCount) * 0.6;
    return [UIColor colorWithRed: 1.0 green:val blue: 0.0 alpha:1.0];
}

#pragma mark - SHCTableViewDataSource methods
-(NSInteger)numberOfRows {
    return _toDoItems.count;
}


-(UITableViewCell *)cellForRow:(NSInteger)row {
    TableViewCell* cell = (TableViewCell*)[self.tableView dequeueReusableCell];
    ToDoItem *item = _toDoItems[row];
    cell.todoItem = item;
    cell.delegate = self;
    cell.backgroundColor = [self colorForIndex:row];
    return cell;
}

#pragma mark - UITableViewDataDelegate protocol methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [self colorForIndex:indexPath.row];
}

-(void) toDoItemDeleted:(ToDoItem*)todoItem {
    float delay = 0.0;

    // remove the model object
    [_toDoItems removeObject:todoItem];

    // find the visible cells
    NSArray* visibleCells = [self.tableView visibleCells];

    UIView* lastView = [visibleCells lastObject];
    bool startAnimating = false;

    // iterate over all of the cells
    for(TableViewCell* cell in visibleCells) {
        if (startAnimating) {
            [UIView animateWithDuration:0.3 delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
                cell.frame = CGRectOffset(cell.frame, 0.0f, -cell.frame.size.height);
            } completion:^(BOOL finished){
                if (cell == lastView) {
                    [self.tableView reloadData];
                }
            }];
            delay+=0.03;
        }
        // if we have reached the item that was deleted, start animating
        if (cell.todoItem == todoItem) {
            startAnimating = true;
            cell.hidden = YES;
        }
    }
}

-(void)cellDidBeginEditing:(TableViewCell *)editingCell {
    _editingOffset = _tableView.scrollView.contentOffset.y - editingCell.frame.origin.y;
    for(TableViewCell* cell in [_tableView visibleCells]) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             cell.frame = CGRectOffset(cell.frame, 0, _editingOffset);
                             if (cell != editingCell) {
                                 cell.alpha = 0.3;
                             }
                         }];
    }
}

-(void)cellDidEndEditing:(TableViewCell *)editingCell {
    for(TableViewCell* cell in [_tableView visibleCells]) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             cell.frame = CGRectOffset(cell.frame, 0, -_editingOffset);
                             if (cell != editingCell)
                             {
                                 cell.alpha = 1.0;
                             }
                         }];
    }
}

- (void)itemAdded {
    [self itemAddedAtIndex:0];
}

- (void)itemAddedAtIndex:(NSInteger)index {
    // create the new item
    ToDoItem* toDoItem = [[ToDoItem alloc] init];
    [_toDoItems insertObject:toDoItem atIndex:index];

    // refresh the table
    [_tableView reloadData];

    // enter edit mode
    TableViewCell* editCell;
    for (TableViewCell* cell in _tableView.visibleCells) {
        if (cell.todoItem == toDoItem) {
            editCell = cell;
            break;
        }
    }
    [editCell.label becomeFirstResponder];
}

@end
