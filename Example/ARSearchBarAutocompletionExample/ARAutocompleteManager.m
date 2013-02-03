//
//  ARAutocompleteManager.m
//  alexruperez
//
//  Created by Alejandro Rupérez on 03/02/13.
//  Inspired by HTAutocompleteManager by HotelTonight.
//
//  Copyright (c) 2013 alexruperez. All rights reserved.
//

#import "ARAutocompleteManager.h"

static ARAutocompleteManager *sharedManager;

@implementation ARAutocompleteManager

+ (ARAutocompleteManager *)sharedManager
{
	static dispatch_once_t done;
	dispatch_once(&done, ^{ sharedManager = [[ARAutocompleteManager alloc] init]; });
	return sharedManager;
}

#pragma mark - ARAutocompleteTextFieldDelegate

- (NSString *)searchBar:(ARAutocompleteSearchBar *)searchBar completionForPrefix:(NSString *)prefix ignoreCase:(BOOL)ignoreCase
{
    if (searchBar.autocompleteType == ARAutocompleteTypeEmail)
    {
        static dispatch_once_t onceToken;
        static NSArray *autocompleteArray;
        dispatch_once(&onceToken, ^
        {
            autocompleteArray = @[  @"gmail.com",
                                    @"yahoo.com",
                                    @"hotmail.com",
                                    @"aol.com",
                                    @"comcast.net",
                                    @"me.com",
                                    @"msn.com",
                                    @"live.com",
                                    @"sbcglobal.net",
                                    @"ymail.com",
                                    @"att.net",
                                    @"mac.com",
                                    @"cox.net",
                                    @"verizon.net",
                                    @"hotmail.co.uk",
                                    @"bellsouth.net",
                                    @"rocketmail.com",
                                    @"aim.com",
                                    @"yahoo.co.uk",
                                    @"earthlink.net",
                                    @"charter.net",
                                    @"optonline.net",
                                    @"shaw.ca",
                                    @"yahoo.ca",
                                    @"googlemail.com",
                                    @"mail.com",
                                    @"qq.com",
                                    @"btinternet.com",
                                    @"mail.ru",
                                    @"live.co.uk",
                                    @"naver.com",
                                    @"rogers.com",
                                    @"jobssy.com",
                                    @"juno.com",
                                    @"yahoo.com.tw",
                                    @"live.ca",
                                    @"walla.com",
                                    @"163.com",
                                    @"roadrunner.com",
                                    @"telus.net",
                                    @"embarqmail.com",
                                    @"hotmail.fr",
                                    @"pacbell.net",
                                    @"sky.com",
                                    @"sympatico.ca",
                                    @"cfl.rr.com",
                                    @"tampabay.rr.com",
                                    @"q.com",
                                    @"yahoo.co.in",
                                    @"yahoo.fr",
                                    @"hotmail.ca",
                                    @"windstream.net",
                                    @"hotmail.it",
                                    @"web.de",
                                    @"asu.edu",
                                    @"gmx.de",
                                    @"gmx.com",
                                    @"insightbb.com",
                                    @"netscape.net",
                                    @"icloud.com",
                                    @"frontier.com",
                                    @"126.com",
                                    @"hanmail.net",
                                    @"suddenlink.net",
                                    @"netzero.net",
                                    @"mindspring.com",
                                    @"ail.com",
                                    @"windowslive.com",
                                    @"netzero.com",
                                    @"yahoo.com.hk",
                                    @"yandex.ru",
                                    @"mchsi.com",
                                    @"cableone.net",
                                    @"yahoo.com.cn",
                                    @"yahoo.es",
                                    @"yahoo.com.br",
                                    @"cornell.edu",
                                    @"ucla.edu",
                                    @"us.army.mil",
                                    @"excite.com",
                                    @"ntlworld.com",
                                    @"usc.edu",
                                    @"nate.com",
                                    @"outlook.com",
                                    @"nc.rr.com",
                                    @"prodigy.net",
                                    @"wi.rr.com",
                                    @"videotron.ca",
                                    @"yahoo.it",
                                    @"yahoo.com.au",
                                    @"umich.edu",
                                    @"ameritech.net",
                                    @"libero.it",
                                    @"yahoo.de",
                                    @"rochester.rr.com",
                                    @"cs.com",
                                    @"frontiernet.net",
                                    @"swbell.net",
                                    @"msu.edu",
                                    @"ptd.net",
                                    @"proxymail.facebook.com",
                                    @"hotmail.es",
                                    @"austin.rr.com",
                                    @"nyu.edu",
                                    @"sina.com",
                                    @"centurytel.net",
                                    @"usa.net",
                                    @"nycap.rr.com",
                                    @"uci.edu",
                                    @"hotmail.de",
                                    @"yahoo.com.sg",
                                    @"email.arizona.edu",
                                    @"yahoo.com.mx",
                                    @"ufl.edu",
                                    @"bigpond.com",
                                    @"unlv.nevada.edu",
                                    @"yahoo.cn",
                                    @"ca.rr.com",
                                    @"google.com",
                                    @"yahoo.co.id",
                                    @"inbox.com",
                                    @"fuse.net",
                                    @"hawaii.rr.com",
                                    @"talktalk.net",
                                    @"gmx.net",
                                    @"walla.co.il",
                                    @"ucdavis.edu",
                                    @"carolina.rr.com",
                                    @"comcast.com",
                                    @"live.fr",
                                    @"blueyonder.co.uk",
                                    @"live.cn",
                                    @"cogeco.ca",
                                    @"abv.bg",
                                    @"tds.net",
                                    @"centurylink.net",
                                    @"yahoo.com.vn",
                                    @"uol.com.br",
                                    @"osu.edu",
                                    @"san.rr.com",
                                    @"rcn.com",
                                    @"umn.edu",
                                    @"live.nl",
                                    @"live.com.au",
                                    @"tx.rr.com",
                                    @"eircom.net",
                                    @"sasktel.net",
                                    @"post.harvard.edu",
                                    @"snet.net",
                                    @"wowway.com",
                                    @"live.it",
                                    @"att.com",
                                    @"vt.edu",
                                    @"rambler.ru",
                                    @"temple.edu",
                                    @"cinci.rr.com",
                                    @"estumail.ucm.es",
                                    @"ucm.es",
                                    @"telefonica.net"];
        });

        // Check that search bar contains an @
        NSRange atSignRange = [prefix rangeOfString:@"@"];
        if (atSignRange.location == NSNotFound)
        {
            return @"";
        }

        // Stop autocomplete if user types dot after domain
        NSString *domainAndTLD = [prefix substringFromIndex:atSignRange.location];
        NSRange rangeOfDot = [domainAndTLD rangeOfString:@"."];
        if (rangeOfDot.location != NSNotFound)
        {
            return @"";
        }

        // Check that there aren't two @-signs
        NSArray *textComponents = [prefix componentsSeparatedByString:@"@"];
        if ([textComponents count] > 2)
        {
            return @"";
        }

        if ([textComponents count] > 1)
        {
            // If no domain is entered, use the first domain in the list
            if ([(NSString *)textComponents[1] length] == 0)
            {
                return [autocompleteArray objectAtIndex:0];
            }

            NSString *textAfterAtSign = textComponents[1];

            NSString *stringToLookFor;
            if (ignoreCase)
            {
                stringToLookFor = [textAfterAtSign lowercaseString];
            }
            else
            {
                stringToLookFor = textAfterAtSign;
            }

            for (NSString *stringFromReference in autocompleteArray)
            {
                NSString *stringToCompare;
                if (ignoreCase)
                {
                    stringToCompare = [stringFromReference lowercaseString];
                }
                else
                {
                    stringToCompare = stringFromReference;
                }

                if ([stringToCompare hasPrefix:stringToLookFor])
                {
                    return [stringFromReference stringByReplacingCharactersInRange:[stringToCompare rangeOfString:stringToLookFor] withString:@""];
                }

            }
        }
    }
    else if (searchBar.autocompleteType == ARAutocompleteTypeColor)
    {
        static dispatch_once_t colorOnceToken;
        static NSArray *colorAutocompleteArray;
        dispatch_once(&colorOnceToken, ^
        {
            colorAutocompleteArray = @[ @"Blue",
                                        @"Yellow",
                                        @"Green",
                                        @"Magenta",
                                        @"Orange",
                                        @"Red",
                                        @"Black",
                                        @"White",
                                        @"Brown",
                                        @"Violet",
                                        @"Pink",
                                        @"Gray",
                                        @"Cyan"];
        });

        NSString *stringToLookFor;
        if (ignoreCase)
        {
            stringToLookFor = [prefix lowercaseString];
        }
        else
        {
            stringToLookFor = prefix;
        }

        for (NSString *stringFromReference in colorAutocompleteArray)
        {
            NSString *stringToCompare;
            if (ignoreCase)
            {
                stringToCompare = [stringFromReference lowercaseString];
            }
            else
            {
                stringToCompare = stringFromReference;
            }

            if ([stringToCompare hasPrefix:stringToLookFor])
            {
                return [stringFromReference stringByReplacingCharactersInRange:[stringToCompare rangeOfString:stringToLookFor] withString:@""];
            }

        }
    }
    else if (searchBar.autocompleteType == ARAutocompleteTypeLast)
    {
        static dispatch_once_t lastOnceToken;
        dispatch_once(&lastOnceToken, ^
                      {
                          self.lastAutocompleteArray = [[NSMutableArray alloc] init];
                      });
        
        NSString *stringToLookFor;
        if (ignoreCase)
        {
            stringToLookFor = [prefix lowercaseString];
        }
        else
        {
            stringToLookFor = prefix;
        }
        
        for (NSString *stringFromReference in self.lastAutocompleteArray)
        {
            NSString *stringToCompare;
            if (ignoreCase)
            {
                stringToCompare = [stringFromReference lowercaseString];
            }
            else
            {
                stringToCompare = stringFromReference;
            }
            
            if ([stringToCompare hasPrefix:stringToLookFor])
            {
                return [stringFromReference stringByReplacingCharactersInRange:[stringToCompare rangeOfString:stringToLookFor] withString:@""];
            }
            
        }
    }

    return @"";
}

@end
