import curses

j = 0
string = ""

def start_curses():
    global j
    global string
    screen = curses.initscr()
    curses.noecho()
    curses.cbreak()
    screen.keypad(1)
    curses.curs_set(0)

    curses.start_color()

#    if curses.has_colors():
#        for i in range(1, 132):
#            curses.init_pair(i, curses.COLOR_RED, curses.COLOR_BLACK)
#            j += 1
#
#    string = curses.color_pair(48)

    return (screen)

def end_curses(screen):
    curses.nocbreak()
    curses.echo()
    screen.keypad(0)
    curses.curs_set(1)
    curses.endwin()

win = start_curses()

try:
    input_char = ""

    win.nodelay(1)
    while input_char != ord('q'):
        win.refresh()
        input_char = win.getch()
        if input_char == curses.KEY_RESIZE:
            print(input_char)

finally:
    end_curses(win)
