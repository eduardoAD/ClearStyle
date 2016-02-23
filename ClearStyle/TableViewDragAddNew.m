//
//  TableViewDragAddNew.m
//  ClearStyle
//
//  Created by Eduardo Alvarado Díaz on 2/15/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import "TableViewDragAddNew.h"
#import "TableViewCell.h"

@implementation TableViewDragAddNew{
    // a cell that is rendered as a placeholder to indicate qhere a new item is added
    TableViewCell* _placeholderCell;
    // indicates the state of this behavior
    BOOL _pullDownInProgress;
    // the table that this gesture is associated with
    TableView* _tableView;
}

- (id)initWithTableView:(TableView *)tableView {
    self = [super init];
    if (self) {
        _placeholderCell = [[TableViewCell alloc] init];
        _placeholderCell.backgroundColor = [UIColor redColor];
        _tableView = tableView;
        _tableView.delegate = self;
    }
    return self;
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // this behaviour starts when a user pulls down while at the top of the table
    _pullDownInProgress = scrollView.contentOffset.y <= 0.0f;
    if (_pullDownInProgress) {
        // add your placeholder
        [_tableView insertSubview:_placeholderCell atIndex:0];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_pullDownInProgress && _tableView.scrollView.contentOffset.y <= 0.0f) {
        // maintain the location of the placeholder
        _placeholderCell.frame = CGRectMake(0, - _tableView.scrollView.contentOffset.y - SHC_ROW_HEIGHT,
                                            _tableView.frame.size.width, SHC_ROW_HEIGHT);
        _placeholderCell.label.text = -_tableView.scrollView.contentOffset.y > SHC_ROW_HEIGHT ?
        @"Release to Add Item" : @"Pull to Add Item";
        _placeholderCell.alpha = MIN(1.0f, - _tableView.scrollView.contentOffset.y / SHC_ROW_HEIGHT);
    } else {
        _pullDownInProgress = false;
    }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    // check whether the user pulled down far enough
    if (_pullDownInProgress && - _tableView.scrollView.contentOffset.y > SHC_ROW_HEIGHT) {
        [_tableView.dataSource itemAdded];
    }
    _pullDownInProgress = false;
    [_placeholderCell removeFromSuperview];
}


@end
