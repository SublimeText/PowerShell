import os
import sublime
from .logger import log

_PowerShellExtensions = set([
        "ps1",
        "psd1",
        "psm1",
        "ps1xml",
        "pssc",
        "psrc"
    ])

def is_ps_file(view):
    global _PowerShellExtensions
    filePath = view.file_name()
    if filePath:
        (root, ext) = os.path.splitext(filePath)
        return ext.lstrip('.') in _PowerShellExtensions
    else:
        # TODO: Support untitled buffers marked as PowerShell
        return False

def get_view_contents(view):
    return view.substr(sublime.Region(0, view.size()))

_outputView = None
def get_output_view():
    global _outputView

    if _outputView is None:
        window = sublime.active_window()
        for view in window.views():
            if view.name() == "PowerShell Output":
                _outputView = view
                break

        if _outputView is None:
            _outputView = sublime.active_window().new_file()
            _outputView.set_name("PowerShell Output")
            _outputView.set_read_only(True)
            _outputView.set_scratch(True)

    log.debug("Found 'PowerShell Output' view %d", _outputView.id())

    return _outputView

def on_view_closed(view):
    global _outputView

    if _outputView != None and _outputView.id() == view.id():
        _outputView = None