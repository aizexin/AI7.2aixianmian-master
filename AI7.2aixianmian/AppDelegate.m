//
//  AppDelegate.m
//  AI7.2aixianmian
//
//  Created by qianfeng on 15/9/23.
//  Copyright (c) 2015年 aizexin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property(nonatomic,assign,getter=isOut)BOOL Out;
@property(nonatomic,strong)UIPageControl *pageCtr;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //1.初始化out  只有isOut为yes 的时候才进入
    self.Out = NO;
    //2.判断该应用是否是第一次打开  如果是第一次打开 就先进入前导页 如果不是就直接进入主界面
    //[注意]判断沙盒路径下该应用的文件夹中是否存在aa.tex文件 如果存在就证明不是第一次运行
    NSFileManager *fmManager = [NSFileManager defaultManager];
    [fmManager createDirectoryAtPath:[NSHomeDirectory() stringByAppendingPathComponent:@"aa.txt"] withIntermediateDirectories:NO attributes:nil error:nil];
    BOOL isExists = [fmManager fileExistsAtPath:[NSHomeDirectory() stringByAppendingPathComponent:@"aa.txt"]];
    NSLog(@"%@",NSHomeDirectory());
    if (isExists) {
        [self go2Main];
    }else{
        [self go2Lauch];
    }
    
    
    
    
    
    
    
    [self.window makeKeyAndVisible];
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

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/**
 *  进入主界面
 */
-(void)go2Main{
    //<1>获取plist文件的路径
    NSString * path = [[NSBundle mainBundle] pathForResource:@"LoveFree" ofType:@"plist"];
    //<2>读取plist文件的内容
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //<3>获取所有的键值
    NSArray * keys = @[@"one",@"two",@"three",@"four",@"five"];
    
    //<4>定义一个数组存放所有的子视图控制器
    NSMutableArray * controllers = [[NSMutableArray alloc]init];
    
    //<5>遍历字典 获取视图控制器的名称
    for(int i = 0;i<keys.count;i++)
    {
        NSDictionary * smallDic = [dic objectForKey:keys[i]];
        
        //<6>获取视图控制器的字符串名称
        NSString * controllerStr = smallDic[@"controllerName"];
        
        //<7>将字符串名称转化成类名
        Class controllerClass = NSClassFromString(controllerStr);
        
        //<8>创建视图控制器对象
        UIViewController * controller = [[controllerClass alloc]init];
        
        //<9>添加导航控制器
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:controller];
        
        //<10>为号航条添加标题 同时为tabBar添加标题
        NSString * titleStr = smallDic[@"titleName"];
        controller.navigationItem.title = titleStr;
        nav.tabBarItem.title = titleStr;
        
        //<11>为tabBar添加图片按钮
        NSString * imageStr = smallDic[@"imageName"];
        nav.tabBarItem.image = [[UIImage imageNamed:imageStr]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        
        NSString * selectImageStr = smallDic[@"selectedImage"];
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageStr]imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        
        //<12>将导航控制器添加到数组中
        [controllers addObject:nav];
        
        //<13>为导航条添加背景图片
        [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar.png"] forBarMetrics:UIBarMetricsDefault];
    }
    
    //<14>创建tabBarController对象
    UITabBarController * tabBarCtr = [[UITabBarController alloc]init];
    tabBarCtr.viewControllers = controllers;
    self.window.rootViewController = tabBarCtr;
}
-(void)go2Lauch{
    
}

@end
