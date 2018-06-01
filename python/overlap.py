def get_sample(text, offset, length):
    return text[offset:offset + length]

def get_string(text, increment, length, delimiter):
    offset = 0
    string = ""
    while offset < len(text):
        sub = get_sample(text, offset, length)
        offset += increment
        string = string + sub + delimiter
    return string

sample_input = "the quick brown fox jumped over the lazy dog"

print(sample_input)
print(get_string(sample_input, 3, 3, "|"))
print(get_string(sample_input, 1, 3, "|"))
