//
//  TodayViewController.m
//  WPaper
//
//  Created by Lee on 13-8-30.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "TodayViewController.h"
#import <CoreData/CoreData.h>
#import "ImageButton.h"
#import "TodayCell.h"
#import "TodayModel.h"
#import "WPBeta.h"
#import "WPModelTool.h"
#import "ThumbModel.h"
@interface TodayViewController ()
{
    UIImageView *head;
    UILabel *headLabel;
    UIView *holderView;
    UITableView *tableView;
    int cellNum;
    NSMutableArray *modelArray;
    NSUInteger _numOfImgs;
    NSMutableArray *_photos;
    ASIFormDataRequest *_formDataRequest;
    NSMutableArray *_todayModelArray;
    NSMutableArray *_cellBeginPosArray;
    NSMutableArray *_imgs;
}

@end

@implementation TodayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        holderView = [[UIView alloc] init];
        holderView.frame = [[UIScreen mainScreen] applicationFrame];
        holderView.backgroundColor = BG_COLOR;
        
        head = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headBar.png"]];
        head.frame = CGRectMake(0, 0, SCREEN_WIDTH, HEAD_H);
        
        headLabel = [[UILabel alloc] init];
        headLabel.backgroundColor = CLEANCOLOR;
        headLabel.frame = CGRectMake(100, 0, 120, HEAD_H);
        headLabel.font = HEAD_TITLE_STYLE_FONT;
        headLabel.text = TODAY_HEAD_TITLE;
        headLabel.textAlignment = NSTextAlignmentCenter;
        
        _cellBeginPosArray = [[NSMutableArray alloc] init];
        
        
        _photos = [[NSMutableArray alloc] init];
        //cellNum = 5;
        modelArray = [[NSMutableArray alloc] init];
        TodayModel *todayModel;
        
        _numOfImgs = 0;
        int cellBeginPos = 0;
        [_cellBeginPosArray addObject:[NSNumber numberWithInt:cellBeginPos]];
        for (int i = 0; i < cellNum; i++) {
            todayModel = [[TodayModel alloc] init];
            todayModel.kids = [WPBeta randomArray];
            _numOfImgs = _numOfImgs + [todayModel.kids count];
            todayModel.coverImgUrl = [WPBeta randomImg];
            [modelArray addObject:todayModel];
            [_photos addObject:todayModel.coverImgUrl];
            [_photos addObjectsFromArray:todayModel.kids];
        }
        NSLog(@"_cellBeginPosArray count %d", [_cellBeginPosArray count]);
      
        NSLog(@"_photoscount   %d", [_photos count]);
        _numOfImgs = _numOfImgs + cellNum;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [holderView addSubview:head];
    [holderView addSubview:headLabel];
 
    //[self initTableView];
    [self loadData];
    self.view = holderView;
    
	// Do any additional setup after loading the view.
}

- (void)loadData
{
    if (_formDataRequest == nil) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@%@", API_PRE, API_TODAY]);
        _formDataRequest = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", API_PRE, API_TODAY]]];
    }else{
        [_formDataRequest cancel];
        
    }
    _formDataRequest.delegate = self;
    [_formDataRequest startAsynchronous];
    
}

- (void)initTableView
{
    tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, HEAD_H, SCREEN_WIDTH, SCREEN_HEIGHT - HEAD_H - STATU_BAR_HEIGHT - TAB_BAR_HEIGHT);
    tableView.backgroundColor = CLEANCOLOR;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tableView reloadData];
    [holderView addSubview:tableView];
}

#pragma mark - ASIHTTPReqDelegate
- (void)requestStarted:(ASIHTTPRequest *)request
{

}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"loaded ok");
    NSData *data = [request responseData];
    if (data == nil) {
        //[[SharedAppDelegate client] showInformation:nil info:NETWORK_BUSY];
        return;
    }
    
    NSError *decodeError;
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&decodeError];
    int state = [[dic objectForKey:@"state"] intValue];
    if (state == STATE_OK) {
        NSMutableArray *tempTodayModelArray = [WPModelTool createTodayModelArray:[dic objectForKey:@"value"]];
        NSLog(@"tempTodayModelArray count %d", [tempTodayModelArray count]);
        _numOfImgs = [WPModelTool numOfimgs];
        _imgs = [WPModelTool imgArray];
        NSLog(@"imgs count %d", [_imgs count]);
        if (_photos == nil) {
            _photos = [[NSMutableArray alloc] init];
        }else{
            [_photos removeAllObjects];
        }
        for (int i = 0; i < _numOfImgs; i++) {
            //WPLog(@"urlstring %@", ((ThumbModel *)[_imgs objectAtIndex:i]).imgUrl);
            NSString *urlstring = [NSString stringWithFormat:@"%@%@", API_PRE, ((ThumbModel *)[_imgs objectAtIndex:i]).imgUrl];
            WPPhoto *photo = [[WPPhoto alloc] initWithURL:[NSURL URLWithString:urlstring]];
            //photo.
            [_photos addObject:photo];
        }
        _todayModelArray = tempTodayModelArray;
    }
    [self initTableView];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    
}

#pragma mark -
#pragma mark UItableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int n = [_todayModelArray count];
    return n;
}

- (UITableViewCell *)tableView:(UITableView *)atableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"WP_CELL";
    TodayCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell){
        cell = [[TodayCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    TodayModel *todayModel = [_todayModelArray objectAtIndex:[indexPath row]];
    cell.todayModle = todayModel;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 333.0f;
}

#pragma mark - DetailViewControllerDelegate
- (WPPhoto *)detailViewController:(DetailViewController *)detailVc photoAtIndex:(NSUInteger)index
{
    //WPLog(@"photo index  %d", index);
    WPPhoto *photo = [_photos objectAtIndex:index];
    return photo;
}

- (NSUInteger)numberOfPhotosInDetailVC:(DetailViewController *)detailVc
{
    return _numOfImgs;
}

- (void)showDetailViewWithPos:(NSUInteger)pos
{
    DetailViewController *detailVc = [[DetailViewController alloc] initWithCurrentIndex:pos andTotal:_numOfImgs];
    detailVc.delegate = self;
    [WPViewTool pushView:detailVc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
