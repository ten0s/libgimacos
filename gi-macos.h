#ifndef __GI_MACOS_H__
#define __GI_MACOS_H__

#include <glib.h>

G_BEGIN_DECLS

void gi_macos_disable_zoom_button();
void gi_macos_force_foreground_level();
void gi_macos_set_dock_badge_label(const gchar *label);
void gi_macos_set_process_name(const gchar *name);

G_END_DECLS

#endif // __GI_MACOS_H__
