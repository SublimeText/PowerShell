# Copyright (c) 2014, Guillermo López-Anglada. Please see the AUTHORS file for details.
# All rights reserved. Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.)

'''Wraps a process to make it act as a pipe server. Takes care of supressing
console windows under Windows and other housekeeping.
'''

from subprocess import Popen
from subprocess import PIPE
import threading

from PowerShell.sublime_plugin_lib import PluginLogger
from PowerShell.sublime_plugin_lib.plat import supress_window
from PowerShell.sublime_plugin_lib.path import pushd


_logger = PluginLogger(__name__)


class PipeServer(object):
    '''Starts as process and communicates with it via pipes.
    '''
    status_lock = threading.RLock()

    def __init__(self, args):
        self.proc = None
        self.args = args

    @property
    def is_running(self):
        '''Returns `True` if the server seems to be responsive.
        '''
        try:
            with PipeServer.status_lock:
                return not self.proc.stdin.closed
        except AttributeError:
            _logger.debug('PipeServer not started yet')
            return

    def start(self, working_dir='.'):
        with PipeServer.status_lock:
            if self.is_running:
                _logger.debug(
                    'tried to start an already running PipeServer; aborting')
                return

            with pushd(working_dir):
                _logger.debug('starting PipeServer with args: %s', self.args)
                self.proc = Popen(self.args,
                                  stdout=PIPE,
                                  stdin=PIPE,
                                  stderr=PIPE,
                                  startupinfo=supress_window())

    def stop(self):
        _logger.debug('stopping PipeServer...')
        self.proc.stdin.close()
        self.proc.stdout.close()
        self.proc.kill()