import sublime

class PowerShellPluginSettings:

    def __init__(self, settingsPath):
        userSettings = sublime.load_settings(settingsPath)
        developerSettings = userSettings.get('powershell_developer_settings', {})

        self.languageServiceEnabled = userSettings.get("powershell_language_service_enabled", False)
        self.developer = PowerShellPluginDeveloperSettings(developerSettings)

class PowerShellPluginDeveloperSettings:

    def __init__(self, settings):
        self.powerShellPath = settings.get("powershell_path")
        self.editorServicesModulePath = settings.get("editor_services_module_path")
        self.waitForDebugger = settings.get("wait_for_debugger", False)