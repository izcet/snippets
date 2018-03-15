strings = []

strings.append("foo")
strings.append("bar")
strings.append("wizzly")
strings.append("baz")
strings.append("tomato")

longest = max(len(string) for string in strings)

for y in range(0, longest):
    new_string = "".join(" " + string[y:y + 1] if string[y:y + 1] else "  " for string in strings)
    print new_string[1:]
