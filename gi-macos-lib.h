#ifndef __GI_MACOS_LIB_H__
#define __GI_MACOS_LIB_H__

#include <glib.h>

G_BEGIN_DECLS

void gi_macos_lib_force_foreground_level();
void gi_macos_lib_set_dock_badge_label(const char *label);
void gi_macos_lib_set_process_name(const gchar *name);

G_END_DECLS

#endif // __GI_MACOS_LIB_H__
