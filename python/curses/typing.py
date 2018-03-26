import curses

def start_curses():
    global j
    global string
    screen = curses.initscr()
    curses.noecho()
    curses.cbreak()
    screen.keypad(1)
    curses.curs_set(0)
    return (screen)

def end_curses(screen):
    curses.nocbreak()
    curses.echo()
    screen.keypad(0)
    curses.curs_set(1)
    curses.endwin()

########################################################

def do_text_input(win):
    string = ""
    curses.echo()
    curses.curs_set(1)
    input_char = ""
    win.nodelay(0)
    while input_char not in [ curses.KEY_DOWN,  ord('\r'), 10, ord('\n') ] :
        input_char = win.getch()
        if input_char not in [ curses.ERR, curses.KEY_DOWN, ord('\n') ]  and (0 <= input_char <= 255):
            string = string + chr(input_char) + str(input_char) + str(int(input_char))
        win.refresh
    curses.noecho()
    curses.curs_set(0)
    win.nodelay(1)
    return string


strings = []

win = start_curses()

try:

    input_char = ""

    win.nodelay(1)

    while input_char != ord('q'):
        win.refresh()
        input_char = win.getch()
        if input_char == curses.KEY_RIGHT:
            string = do_text_input(win)
            strings.append(string)
    
    

finally:

    end_curses(win)
    print("{")
    for string in strings:
        print string
    print("}")

