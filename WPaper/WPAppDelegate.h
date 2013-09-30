//
//  WPAppDelegate.h
//  WPaper
//
//  Created by Lee on 13-8-27.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPRootViewController.h"
#import "TodayViewController.h"

@interface WPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationVc;
@property (strong, nonatomic) WPRootViewController *wp_rootViewController;
@property (strong, nonatomic) TodayViewController *todayVc;

//数据模型对象
@property(strong,nonatomic) NSManagedObjectModel *managedObjectModel;
//上下文对象
@property(strong,nonatomic) NSManagedObjectContext *managedObjectContext;

//持久性存储区
@property(strong,nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//初始化Core Data使用的数据库
-(NSPersistentStoreCoordinator *)persistentStoreCoordinator;

//managedObjectModel的初始化赋值函数
-(NSManagedObjectModel *)managedObjectModel;

//managedObjectContext的初始化赋值函数
-(NSManagedObjectContext *)managedObjectContext;

@end


