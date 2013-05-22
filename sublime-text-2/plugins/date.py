# Insert current date string in yyyy/mm/dd format
# 
# Source: http://www.sublimetext.com/forum/viewtopic.php?f=2&t=4947

import sublime, sublime_plugin, time

class DateCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        sel = self.view.sel();
        now = time.time();
        for s in sel:
            self.view.replace(edit, s, time.strftime('%Y/%m/%d', time.localtime(now)));