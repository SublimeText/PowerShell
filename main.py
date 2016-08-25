import os
import time
import sublime
from .editorservices.client import client
from .editorservices.editor import editor
from .editorservices.logger import log
from .editorservices.settings import PowerShellPluginSettings
from .editorservices.listeners import *
from .editorservices.commands import *

def plugin_loaded():

    log.info("PowerShell plugin starting...")

    # NOTE: This must be updated to the latest required PSES version!
    requiredEditorServicesVersion = "0.7.1"

    # Load user settings
    settings = PowerShellPluginSettings("Preferences.sublime-settings")

    # Is the language service enabled?
    if settings.languageServiceEnabled:
        modulePath = settings.developer.editorServicesModulePath
        if modulePath:
            log.info("Found PowerShell Editor Services module path from settings: %s", modulePath)

        # Start the editor client
        client.start(
            settings.developer.powerShellPath,
            modulePath,
            requiredEditorServicesVersion,
            settings.developer.waitForDebugger)

        editor.start()

        log.info("PowerShell plugin started.")
    else:
        log.info("PowerShell language service is disabled, use the following setting to enable it: \"enable_powershell_language_service\": true")

def plugin_unloaded():

    log.info("PowerShell plugin stopping...")

    client.stop()

    log.info("PowerShell plugin stopped.")
