#ifndef __MACOS_H__
#define __MACOS_H__

#ifdef __cplusplus
extern "C" {
#endif

void macos_force_foreground_level();
void macos_set_dock_badge_label(const char *label);
int macos_set_process_name(const char *name);

#ifdef __cplusplus
}
#endif

#endif // __MACOS_H__
