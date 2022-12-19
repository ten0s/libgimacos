imports.gi.versions.Gtk = '3.0'
const {Gtk} = imports.gi
const MacOSLib = imports.gi.MacOSLib

Gtk.init(null)

const title = 'Hello'
const resizable = false
const window = new Gtk.Window({
    title,
    resizable,
    window_position: Gtk.WindowPosition.CENTER,
})
window.set_default_size(250, 100)
window.connect('show', () => {
    setTimeout(() => {
        if (!resizable) {
            MacOSLib.disable_zoom_button()
        }
        MacOSLib.force_foreground_level()
        MacOSLib.set_process_name(title)
    }, 0)
    let flag = true
    setInterval(() => {
        if (flag) {
            MacOSLib.set_dock_badge_label(title)
        } else {
            MacOSLib.set_dock_badge_label('')
        }
        flag = !flag
    }, 1000)
    Gtk.main()
})
window.connect('destroy', () => Gtk.main_quit())
window.add(new Gtk.Label({label: 'Hello Gtk-3.0'}))
window.show_all()
