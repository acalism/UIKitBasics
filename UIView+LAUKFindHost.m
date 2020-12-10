#import "UIView+LAUKFindHost.h"


NS_ASSUME_NONNULL_BEGIN

@implementation UIView (LAUKFindHost)

- (UIViewController * _Nullable)lauk_hostVC
{
    UIResponder *r = self;
    while (nil != r && ![r isKindOfClass:UIViewController.class]) {
        r = r.nextResponder;
    }
    return (UIViewController *)r;
}

- (nullable UINavigationController *)lauk_hostNav
{
    UIViewController *hostVC = self.lauk_hostVC;
    UINavigationController *nav = hostVC.lauk_navigationController;
    return nav;
}

- (UITableViewCell * _Nullable)lauk_hostTableViewCell
{
    UIView *v = self.superview;
    while (nil != v && ![v isKindOfClass:UITableViewCell.class]) {
        v = v.superview;
    }
    return (UITableViewCell *)v;
}

- (UICollectionReusableView * _Nullable)lauk_hostCollectionReusableView
{
    UIView *v = self.superview;
    while (nil != v && ![v isKindOfClass:UICollectionReusableView.class]) {
        v = v.superview;
    }
    return (UICollectionReusableView *)v;
}

- (UICollectionViewCell * _Nullable)lauk_hostCollectionViewCellIn:(UICollectionView *)collectionView
{
    NSIndexPath *ip = nil;

    //UICollectionReusableView *v = [collectionView cellForItemAtIndexPath:ip];
    UICollectionViewCell *cell = (UICollectionViewCell *)self.lauk_hostCollectionReusableView;
    while (nil != cell && [cell isKindOfClass:UICollectionViewCell.class]) {
        ip = [collectionView indexPathForCell:cell];
        if (nil != ip) {
            break;
        }
        // nested cells
        cell = (UICollectionViewCell *)cell.lauk_hostCollectionReusableView;
    }
    if ([cell isKindOfClass:UICollectionViewCell.class]) {
        return cell;
    }
    return nil;
}

- (UITableViewCell * _Nullable)lauk_hostTableViewCellIn:(UITableView *)tableView
{
    NSIndexPath *ip = nil;
    UITableViewCell *cell = self.lauk_hostTableViewCell;
    while (nil != cell) {
        ip = [tableView indexPathForCell:cell];
        if (nil != ip) {
            break;
        }
        // nested cells
        cell = cell.lauk_hostTableViewCell;
    }
    return cell;
}


- (NSIndexPath * _Nullable)lauk_indexPathInCollectionView:(UICollectionView *)collectionView
{
    NSIndexPath *ip = nil;
    CGPoint point = [collectionView convertPoint:self.center fromCoordinateSpace:self.superview];
    ip = [collectionView indexPathForItemAtPoint:point];
    return ip;
}

- (NSIndexPath * _Nullable)lauk_indexPathInTableView:(UITableView *)tableView
{
    NSIndexPath *ip = nil;
    CGPoint point = [tableView convertPoint:self.center fromCoordinateSpace:self.superview];
    ip = [tableView indexPathForRowAtPoint:point];
    return ip;
}

@end


@implementation UIViewController (LAUKFindHost)

- (nullable UINavigationController *)lauk_navigationController
{
    UIViewController *hostVC = self;
    UINavigationController *nav = hostVC.navigationController;
    if (nil == nav && [hostVC isKindOfClass:UINavigationController.class]) {
        nav = (UINavigationController *)hostVC;
    }
    return nav;
}

@end


@implementation UITableViewCell (LAUKFindHost)

- (UITableView * _Nullable)lauk_hostTableView
{
    UIView *v = self.superview;
    while (nil != v && ![v isKindOfClass:UITableView.class]) {
        v = v.superview;
    }
    return (UITableView *)v;
}

@end


@implementation UICollectionReusableView (LAUKFindHost)

- (UICollectionView * _Nullable)lauk_hostCollectionView
{
    UIView *v = self.superview;
    while (nil != v && ![v isKindOfClass:UICollectionView.class]) {
        v = v.superview;
    }
    return (UICollectionView *)v;
}

@end

NS_ASSUME_NONNULL_END
