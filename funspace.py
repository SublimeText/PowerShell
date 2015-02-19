'''
Runs PS code.
'''

import os
import sublime
import sublime_plugin

from PowerShell.pipe_server import PipeServer
from PowerShell.sublime_plugin_lib.io import AsyncStreamReader


g_server = None


def plugin_loaded():
	sublime.set_timeout(init, 750)


def init():
	global g_server
	path_to_server = os.path.join(sublime.packages_path(), 'PowerShell\\funspace.exe')
	g_server = Funspace(path_to_server)
	g_server.start()


class Funspace(object):
	def __init__(self, path):
		self.path = path
		print ('exists:', os.path.exists(self.path))
		self.server = PipeServer([self.path])

	def start(self):
		self.server.start(working_dir=os.path.dirname(self.path))
		reader = AsyncStreamReader(self.server.proc.stdout, self.on_data)
		reader.daemon = True
		reader.start()

	def on_data(self, data):
		print(data.decode('utf-8').rstrip() + '\n')

	def run_ps(self, text):
		self.server.proc.stdin.write('{}\n'.format(text).encode('utf-8'))
		self.server.proc.stdin.flush()


class PsRunLineCommand(sublime_plugin.WindowCommand):
	def run(self):
		v = self.window.active_view()
		text = v.substr(v.line(v.sel()[0].b))
		if g_server:
			g_server.run_ps(text)