//
//  WPAppDelegate.m
//  WPaper
//
//  Created by Lee on 13-8-27.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import "WPAppDelegate.h"
#import "TodayViewController.h"
#import "WPTabBarController.h"
#import "TodayViewController.h"
#import "TopicViewController.h"
#import "AllViewController.h"
#import "CateViewController.h"
#import "MoreViewController.h"


@implementation WPAppDelegate
@synthesize navigationVc, wp_rootViewController, managedObjectModel = _managedObjectModel, managedObjectContext = _managedObjectContext, persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize todayVc = _todayVc;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [application setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
    // Override point for customization after application launch.
    [self setup];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
//这个方法定义的是当应用程序退到后台时将执行的方法，按下home键执行（通知中心来调度）
//实现此方法的目的是将托管对象上下文存储到数据存储区，防止程序退出时有未保存的数据
- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSError *error;
    if (_managedObjectContext != nil) {
        //hasChanges方法是检查是否有未保存的上下文更改，如果有，则执行save方法保存上下文
        if ([_managedObjectContext hasChanges] && ![_managedObjectContext save:&error]) {
            NSLog(@"Error: %@,%@",error,[error userInfo]);
            abort();
        }
    }
}




- (void)setup
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self setMainView_iPhone];
    }else{
        [self setMainView_iPad];
    }
}

- (void)setMainView_iPhone
{
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"theme"] == 0) {
        [[NSUserDefaults standardUserDefaults] setInteger:CYSHOW_DAY_THEME forKey:@"theme"];
    }
    _todayVc = [[TodayViewController alloc] init];
    //todayVc.view.backgroundColor = RGBCOLOR(255, 255, 0);
    
    TopicViewController *topicVc = [[TopicViewController alloc] init];
    topicVc.view.backgroundColor = RGBCOLOR(255, 255, 255);
    
    AllViewController *allVc = [[AllViewController alloc] init];
    allVc.view.backgroundColor = RGBCOLOR(255, 0, 0);
    
    CateViewController *cateVc = [[CateViewController alloc] init];
    cateVc.view.backgroundColor = RGBCOLOR(200, 233, 123);
    
    MoreViewController *moreVc = [[MoreViewController alloc] init];
    moreVc.view.backgroundColor = RGBCOLOR(0, 255, 0);
    
    NSArray *vcs = [NSArray arrayWithObjects:_todayVc, topicVc, allVc, cateVc, moreVc, nil];
    
    WPTabBarController *tabVc = [[WPTabBarController alloc] initWithViewControllers:vcs imageArray:nil];
    self.navigationVc = [[UINavigationController alloc] initWithRootViewController:tabVc];
    self.navigationVc.navigationBar.tintColor = RGBCOLOR(255, 0, 0);
    [self.navigationVc setNavigationBarHidden:YES];
    self.window.rootViewController = self.navigationVc;
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    NSString *nameStr = NSStringFromClass([self class]);
    NSLog(@"self class : %@", nameStr);
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM dd, yyyy"];
    //[formatter setTimeStyle:NSDateFormatterMediumStyle];
    NSLog(@"今天是  %@", [formatter stringFromDate:date]);
    
    NSProcessInfo *info = [NSProcessInfo processInfo];
    NSLog(@"\t%@\t%d\t%d", [info processName],[info processIdentifier],[info processorCount]);
}

- (void)setMainView_iPad
{
    //do iPad
}

-(NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return _managedObjectModel;
}

-(NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    //得到数据库的路径
    NSString *docs = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //CoreData是建立在SQLite之上的，数据库名称需与Xcdatamodel文件同名
    NSURL *storeUrl = [NSURL fileURLWithPath:[docs stringByAppendingPathComponent:@"PaperModel.sqlite"]];
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self managedObjectModel]];
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }
    
    return _persistentStoreCoordinator;
}

-(NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator =[self persistentStoreCoordinator];
    
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc]init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return _managedObjectContext;
}

@end
