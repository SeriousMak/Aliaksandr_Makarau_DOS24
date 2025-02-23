# Скрипт, который принимает на вход кортеж и проверяет, все ли его элементы являются уникальными.

def unique_elements(tup):
    return len(tup) == len(set(tup))

# Ввод элементов input
elements = input("Введите элементы кортежа, разделенные запятыми: ")
tuple_input = tuple(map(int, elements.split(',')))

# Вывод: True/False
print(unique_elements(tuple_input))
