#include <AppKit/AppKit.h>

extern OSErr CPSSetProcessName(ProcessSerialNumber *psn, const char *name);

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
    [[NSApp dockTile] setBadgeLabel:@(label)];
    [[NSApp dockTile] display];
}
