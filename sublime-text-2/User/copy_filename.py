# -*- coding: utf-8 -*-

import sublime, sublime_plugin, os

class CopyFilenameCommand(sublime_plugin.TextCommand):
   def run(self, edit):
      sublime.set_clipboard(os.path.basename(self.view.file_name()))
      sublime.status_message("Copied file name")