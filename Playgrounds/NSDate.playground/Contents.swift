//: Playground - noun: a place where people can play

import UIKit


//formatter used to prove output
let formatter = NSDateFormatter()
formatter.timeZone = NSCalendar.currentCalendar().timeZone
formatter.dateStyle = .MediumStyle
formatter.timeStyle = .MediumStyle


/* 
Get todays date and print
*/
let date = NSDate()
let dateString = formatter.stringFromDate(date)

/*
Get tomorrows date
*/
var tomorrowComponents = NSDateComponents()
tomorrowComponents.day = 1
let tomorrow = NSCalendar.currentCalendar().dateByAddingComponents(tomorrowComponents, toDate: date, options: NSCalendarOptions.allZeros)!


/*
Reset the time on tomorrows date to 9am
*/
let allComponents = (
    NSCalendarUnit.CalendarUnitYear |
        NSCalendarUnit.CalendarUnitMonth |
        NSCalendarUnit.CalendarUnitDay |
        NSCalendarUnit.CalendarUnitHour |
        NSCalendarUnit.CalendarUnitMinute |
        NSCalendarUnit.CalendarUnitSecond |
        NSCalendarUnit.CalendarUnitTimeZone
)
let tomorrowAtNineAmComponents = NSCalendar.currentCalendar().components(allComponents, fromDate: tomorrow)
tomorrowAtNineAmComponents.hour = 9
tomorrowAtNineAmComponents.minute = 0
tomorrowAtNineAmComponents.second = 0
let tomorrowAtNineAm = NSCalendar.currentCalendar().dateFromComponents(tomorrowAtNineAmComponents)!

/*
Output result
*/
let tomorrowAtNineAmDateString = formatter.stringFromDate(tomorrowAtNineAm)

