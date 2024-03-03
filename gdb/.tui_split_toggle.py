import gdb

# Doc for this is at https://sourceware.org/gdb/current/onlinedocs/gdb.html/CLI-Commands-In-Python.html#CLI-Commands-In-Python

class TuiSplitToggle(gdb.Command):
    """Enter/Exit tui mode with the split layout"""

    def __init__(self):
        super(TuiSplitToggle, self).__init__("tui-split-toggle", gdb.COMMAND_USER)
        self.tui = False # instance variable unique to each instance

    def invoke(self, arg, from_tty):
        if self.tui:
            gdb.execute("tui disable")
            self.tui = False
        else:
            gdb.execute("with height 0 -- layout split")
            self.tui = True


TuiSplitToggle()
