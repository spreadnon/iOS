//
//  FFBannerView.m
//  FFBannerView
//
//  Created by Fan on 16/10/10.
//  Copyright © 2016年 Fan. All rights reserved.
//

#import "FFBannerView.h"
#import "FFBannerViewCell.h"
#import "FFPageControl.h"
#import "FFCustomSquareDotView.h"
#import <YYWebImage.h>

#define kDefaultPageControlHeight   30.0f

@interface FFBannerView () <UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property(nonatomic, strong) FFPageControl *pageControl;

@property(nonatomic, strong) NSMutableArray *imageArray;    ///< 存储显示图片数组
@property(nonatomic, assign) NSInteger  totalImageCount;    ///< 单次总轮播次数(轮播数量*100)

@property(nonatomic, strong) NSTimer *timer;
@end

static NSString *CellID = @"CellID";

@implementation FFBannerView

#pragma mark - Public Method
+ (instancetype)bannerViewWithFrame:(CGRect)frame locationImageArray:(NSArray *)locationImageArray
{
    FFBannerView *bannerView = [[self alloc] initWithFrame:frame];
    if (!locationImageArray.count) {
        return bannerView;
    }
    bannerView.locationImageArr = (NSMutableArray *)locationImageArray;
    return bannerView;
}

+ (instancetype)bannerViewWithFrame:(CGRect)frame netWorkImageArray:(NSArray *)netWorkImageArray placeHolderImage:(UIImage *)placeHolderImage;
{
    FFBannerView *bannerView = [[self alloc] initWithFrame:frame];
    bannerView.placeHolder = placeHolderImage;
    if (!netWorkImageArray.count) {
        return bannerView;
    }
    bannerView.netWorkImageArr = (NSMutableArray *)netWorkImageArray;
    return bannerView;
}

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    _pageControlStyle           = FFPageControlStyleLeft;
    _timeInterval               = 2.0f;
    
    [self addSubview:self.collectionView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置初始显示位置
    if (self.collectionView.contentOffset.x == 0 &&  self.totalImageCount) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.totalImageCount * 0.5 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:false];
    }
    
    switch (_pageControlStyle) {
        case FFPageControlStyleLeft:
        
            self.pageControl.frame = CGRectMake(0, self.frame.size.height - kDefaultPageControlHeight, [self.pageControl sizeForNumberOfPages:self.imageArray.count].width, kDefaultPageControlHeight);
            break;
            
        case FFPageControlStyleMiddle:
            self.pageControl.frame = CGRectMake(0, self.frame.size.height - 20, self.frame.size.width, kDefaultPageControlHeight);
            break;
            
        case FFPageControlStyleRight:
            self.pageControl.frame = CGRectMake(self.frame.size.width - [self.pageControl sizeForNumberOfPages:self.imageArray.count].width, self.frame.size.height - kDefaultPageControlHeight , [self.pageControl sizeForNumberOfPages:self.imageArray.count].width, kDefaultPageControlHeight);
            break;
        default:
            break;
    }
}

- (void)dealloc
{
    [_timer invalidate];
    _timer = nil;
}

//解决当父View释放时，当前视图因为被Timer强引用而不能释放的问题
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (!newSuperview) {
        [self removeTimer];
    }
}

/*-------------------------------------定时器相关----------------------------------*/
//加载定时器
- (void)setupTimer
{
    if (self.locationImageArr.count == 1 || self.netWorkImageArr.count == 1) {
        return;
    }
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(timerRun) userInfo:nil repeats:true];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

//移除定时器
- (void)removeTimer
{
    [_timer invalidate];
    _timer = nil;
}

- (void)timerRun
{
    if (!self.imageArray.count) {
        return;
    }
    
    NSInteger currentPage = self.collectionView.contentOffset.x / self.flowLayout.itemSize.width;
    NSInteger targetPage = currentPage + 1;
    if (targetPage == self.totalImageCount) {
        targetPage = self.totalImageCount * 0.5;
        
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetPage inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:false];
    }
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetPage inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:true];
}

#pragma mark - UIScrollViewDelegate
/*
 *  通过滑动的偏移位置来计算当前pageControl的currentPage
 *  注：在配置collectionCell时设置pageControl的currentPage会有Bug
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int itemIndex = (scrollView.contentOffset.x + self.collectionView.frame.size.width * 0.5) / self.collectionView.frame.size.width;
    if (!self.imageArray.count) return; // 解决清除timer时偶尔会出现的问题
    int indexOnPageControl = itemIndex % self.imageArray.count;
    
    self.pageControl.currentPage = indexOnPageControl;
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self setupTimer];
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.item % self.imageArray.count;
    if ([self.delegate respondsToSelector:@selector(ffBannerViewClickCurrentIndex:)]) {
        [self.delegate ffBannerViewClickCurrentIndex:index];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.totalImageCount;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FFBannerViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellID forIndexPath:indexPath];
    NSInteger index = indexPath.item % self.imageArray.count;
//    UIImage *image = self.imageArray[index];
    
    id obj = self.imageArray[index];
    if ([obj isKindOfClass:[UIImage class]]) {
        cell.imageView.image = (UIImage *)obj;
    }
    if ([obj isKindOfClass:[NSURL class]]) {
        [cell.imageView yy_setImageWithURL:(NSURL *)obj placeholder:self.placeHolder];
    }
    
    return cell;
}

#pragma mark - setter
- (void)setPageControlStyle:(FFPageControlStyle)pageControlStyle
{
    _pageControlStyle = pageControlStyle;
}

- (void)setPlaceHolder:(UIImage *)placeHolder
{
    _placeHolder = placeHolder;
}

- (void)setLocationImageArr:(NSMutableArray *)locationImageArr
{
    _locationImageArr = locationImageArr;
    NSMutableArray *locationImages = [NSMutableArray arrayWithCapacity:locationImageArr.count];
    for (NSInteger i=0; i<locationImageArr.count; i++) {
        UIImage *image = [UIImage imageNamed:locationImageArr[i]];
        [locationImages addObject:image];
    }
    
    self.imageArray = locationImages;
}

- (void)setNetWorkImageArr:(NSMutableArray *)netWorkImageArr
{
    _netWorkImageArr = netWorkImageArr;
    NSMutableArray *netWorkImages = [NSMutableArray arrayWithCapacity:netWorkImageArr.count];
    for (NSInteger i=0; i<netWorkImageArr.count; i++) {
        
        if ([netWorkImageArr[i] isKindOfClass:[NSString class]]) {
            NSURL *urlImg = [NSURL URLWithString:netWorkImageArr[i]];
            [netWorkImages addObject:urlImg];
        } else if ([netWorkImageArr[i] isKindOfClass:[NSURL class]]) {
            [netWorkImages addObject:netWorkImageArr[i]];
        }
    }
    self.imageArray = netWorkImages;
}

- (void)setImageArray:(NSMutableArray *)imageArray
{
    _imageArray = imageArray;
    if (imageArray.count > 1) {
        [self setupTimer];
        _totalImageCount = imageArray.count * 100;
    } else {
        _totalImageCount = imageArray.count;
        [self removeTimer];
    }
    
    if (!_pageControl) {
        [self addSubview:self.pageControl];
    }
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval
{
    _timeInterval = timeInterval;
    if (timeInterval <= 0) {
        _timeInterval = 2.0f;
    }
    
    [self removeTimer];
    [self setupTimer];
}

#pragma mark - getter
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 0, self.frame.size.height - 20) collectionViewLayout:self.flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = false;
        _collectionView.showsHorizontalScrollIndicator = false;
        _collectionView.pagingEnabled = true;
        [_collectionView registerClass:[FFBannerViewCell class] forCellWithReuseIdentifier:CellID];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.itemSize = self.bounds.size;
        _flowLayout.minimumLineSpacing = 0;
        _flowLayout.minimumInteritemSpacing = 0;
    }
    return _flowLayout;
}

- (FFPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[FFPageControl alloc] init];
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = self.imageArray.count;
        _pageControl.hidesForSinglePage = true;
        _pageControl.dotColor = [UIColor redColor];
        _pageControl.currentDotColor = [UIColor greenColor];
        //setting custom PageControl Dot View
        _pageControl.dotViewClass = [FFCustomSquareDotView class];
        
        /*----------使用图片替代-----------*/
        _pageControl.dotSize = CGSizeMake(6, 6);
        _pageControl.dotImage = [UIImage imageNamed:@"circle_Icon_n"];
        _pageControl.currentDotImage = [UIImage imageNamed:@"circle_Icon_h"];
    }
    return _pageControl;
}
@end
