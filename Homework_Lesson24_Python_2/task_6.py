# Скрипт, который принимает на вход строку и заменяет в ней все гласные буквы на символ "-".
def replace_vowels_with_dash(input_string):
    vowels = "аяёеиоуюяАЁЕИОУЫЯ"  # Гласные буквы
    result = ''.join(['-' if char in vowels else char for char in input_string])
    return result

# Пример использования
input_str = input("Введите строку: ")
output_str = replace_vowels_with_dash(input_str)
print("Результат:", output_str)