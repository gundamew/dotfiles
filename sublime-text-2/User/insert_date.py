# -*- coding: utf-8 -*-

from datetime import datetime
import sublime_plugin

class InsertDateCommand(sublime_plugin.EventListener):
    def on_query_completions(self, view, prefix, locations):
        if prefix == 'today':
            val = datetime.now().strftime('%Y-%m-%d')
        else:
            val = None

        return [(prefix, prefix, val)] if val else []