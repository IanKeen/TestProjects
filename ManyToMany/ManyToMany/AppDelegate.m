//
//  AppDelegate.m
//  ManyToMany
//
//  Created by Ian Keen on 25/05/2015.
//  Copyright (c) 2015 Mustard. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"
#import "Brand.h"

@interface AppDelegate ()
@end

@interface NSArray (Map)
-(NSArray *)map:(id(^)(id object))function;
@end
@implementation NSArray (Map)
-(NSArray *)map:(id (^)(id))function {
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [result addObject:function(obj)];
    }];
    return result;
}
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //create the entities
    for (NSInteger i = 0; i < 2; i++) {
        NSEntityDescription *desc = [NSEntityDescription entityForName:NSStringFromClass([Person class]) inManagedObjectContext:[self managedObjectContext]];
        Person *entity = [[Person alloc] initWithEntity:desc insertIntoManagedObjectContext:[self managedObjectContext]];
        entity.name = [NSString stringWithFormat:@"Person %@", @(i)];
    }
    for (NSInteger i = 0; i < 2; i++) {
        NSEntityDescription *desc = [NSEntityDescription entityForName:NSStringFromClass([Brand class]) inManagedObjectContext:[self managedObjectContext]];
        Brand *entity = [[Brand alloc] initWithEntity:desc insertIntoManagedObjectContext:[self managedObjectContext]];
        entity.name = [NSString stringWithFormat:@"Brand %@", @(i)];
    }
    
    //create the relationships (all people to all brands)
    NSFetchRequest *peopleRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Person class])];
    NSArray *people = [[self managedObjectContext] executeFetchRequest:peopleRequest error:nil];
    NSFetchRequest *brandRequest = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Brand class])];
    NSArray *brands = [[self managedObjectContext] executeFetchRequest:brandRequest error:nil];
    for (Person *person in people) {
        //using innerloop to simply show individual adding of brands
        for (Brand *brand in brands) {
            [person addBrandsObject:brand];
        }
    }
    [self saveContext];
    
    
    //prove the relationships
    NSFetchRequest *peopleRequest2 = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Person class])];
    NSArray *people2 = [[self managedObjectContext] executeFetchRequest:peopleRequest2 error:nil];
    NSFetchRequest *brandRequest2 = [[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([Brand class])];
    NSArray *brands2 = [[self managedObjectContext] executeFetchRequest:brandRequest2 error:nil];
    
    //print people
    NSLog(@"PEOPLE");
    for (Person *person in people2) {
        NSLog(@"%@: %@", person.name, [[person.brands allObjects] map:^id(Brand *object) {
            return object.name;
        }]);
    }

    NSLog(@"BRANDS");
    for (Brand *brand in brands2) {
        NSLog(@"%@: %@", brand.name, [[brand.people allObjects] map:^id(Person *object) {
            return object.name;
        }]);
    }

    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.mustard.ManyToMany" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ManyToMany" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ManyToMany.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}
- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support
- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}
@end
