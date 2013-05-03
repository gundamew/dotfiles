# Copy current file name or full path
# 
# Source: http://www.sublimetext.com/forum/viewtopic.php?f=4&t=5839

import sublime, sublime_plugin, os

class FilenameToClipboardCommand(sublime_plugin.TextCommand):
   def run(self, edit):
      sublime.set_clipboard(os.path.basename(self.view.file_name()))

class PathToClipboardCommand(sublime_plugin.TextCommand):
   def run(self, edit):
      sublime.set_clipboard(self.view.file_name())