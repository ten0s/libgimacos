#include "gi-macos-lib.h"
#include "macos.h"

/**
 * gi_macos_lib_force_foreground_level:
 *
 * Forces foreground level.
 */
void
gi_macos_lib_force_foreground_level()
{
    macos_force_foreground_level();
}

/**
 * gi_macos_lib_set_process_name:
 * @name: (transfer: none) (not nullable): Process name
 *
 * Sets process name.
 */
void
gi_macos_lib_set_process_name(const gchar *name)
{
    int err = macos_set_process_name(name);
    if (err) {
        g_print("CPSSetProcessName error: %d\n", err);
    }
}
