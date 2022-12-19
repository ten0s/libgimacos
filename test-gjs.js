const MacOSLib = imports.gi.MacOSLib

MacOSLib.force_foreground_level()
MacOSLib.set_dock_badge_label('Hello')
MacOSLib.set_process_name('Hello')
