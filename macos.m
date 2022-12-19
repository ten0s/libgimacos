#include <AppKit/AppKit.h>

extern OSErr CPSSetProcessName(ProcessSerialNumber *psn, const char *name);

void macos_disable_zoom_button()
{
    // NSApp.mainWindow is nil in BigSur and Monterey.
    // Brute force over all windows.
    NSArray *windows = NSApp.windows;
    for (NSWindow *window in windows) {
        NSWindowCollectionBehavior behavior = window.collectionBehavior;
        behavior &= ~(
            NSWindowCollectionBehaviorFullScreenPrimary |
            NSWindowCollectionBehaviorFullScreenAuxiliary
        );
        behavior |= NSWindowCollectionBehaviorFullScreenNone;
        window.collectionBehavior = behavior;

        NSButton *button = [window standardWindowButton:NSWindowZoomButton];
        button.enabled = NO;
    }
}

void macos_force_foreground_level()
{
    [NSApp activateIgnoringOtherApps:YES];
}

int macos_set_process_name(const char *name)
{
    ProcessSerialNumber psn = {0};
    psn.highLongOfPSN = 0;
    psn.lowLongOfPSN = kCurrentProcess;
    return CPSSetProcessName(&psn, name);
}

void macos_set_dock_badge_label(const char *label)
{
    NSApp.dockTile.badgeLabel = @(label);
    [NSApp.dockTile display];
}

// TODO:
// https://developer.apple.com/documentation/appkit/nsapplication/1428744-applicationiconimage?language=objc
// NSApp.applicationIconImage
