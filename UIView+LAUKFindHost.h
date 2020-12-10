
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LAUKFindHost)
@property(nonatomic, strong, readonly, nullable) UIViewController * lauk_hostVC;
@property(nonatomic, strong, readonly, nullable) UINavigationController * lauk_hostNav;

@property(nonatomic, strong, readonly, nullable) UITableViewCell * lauk_hostTableViewCell;
@property(nonatomic, strong, readonly, nullable) UICollectionReusableView *lauk_hostCollectionReusableView;

/// Can handle nested cells
- (UICollectionViewCell * _Nullable)lauk_hostCollectionViewCellIn:(UICollectionView *)collectionView;
- (UITableViewCell * _Nullable)lauk_hostTableViewCellIn:(UITableView *)tableView;

- (NSIndexPath * _Nullable)lauk_indexPathInCollectionView:(UICollectionView *)collectionView;
- (NSIndexPath * _Nullable)lauk_indexPathInTableView:(UITableView *)tableView;
@end


@interface UIViewController (LAUKFindHost)
@property(nonatomic, strong, readonly, nullable) UINavigationController *lauk_navigationController;
@end


@interface UITableViewCell (LAUKFindHost)
@property(nonatomic, strong, readonly, nullable) UITableView * lauk_hostTableView;
@end


@interface UICollectionReusableView (LAUKFindHost)
@property(nonatomic, strong, readonly, nullable) UICollectionView * lauk_hostCollectionView;
@end

NS_ASSUME_NONNULL_END
