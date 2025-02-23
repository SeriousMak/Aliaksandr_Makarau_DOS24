# Данный скрипт принимает две строки и выводит те, которые встречаются в обеих строках

def common_characters(string1, string2):
    common_chars = []
    for char in string1:
        if char in string2 and char not in common_chars:
            common_chars.append(char)
    return ''.join(common_chars)

# Ввод строк через Input
str1 = input("Введите первую строку: ")
str2 = input("Введите вторую строку: ")
result = common_characters(str1, str2)

print('Символы, встречающиеся в обеих строках:', result)