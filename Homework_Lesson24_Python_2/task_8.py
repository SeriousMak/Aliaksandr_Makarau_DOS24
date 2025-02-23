# Скрипт, который принимает на вход список чисел и удаляет из него все числа, которые меньше заданного пользователем значения.
def remove_less_than(numbers, threshold):
    # Создние нового списка
    filtered_numbers = []
    
    # Проходим по всем числам в исходном списке
    for num in numbers:
        # Если число больше или равно порогу, добавляем его в новый список
        if num >= threshold:
            filtered_numbers.append(num)
    
    return filtered_numbers

# Ввод чисел от пользователя
elements = input("Введите числа через запятую: ")
# Преобразуем список введеных чисел
number_list = [int(num) for num in elements.split(',')]

# Ввод порогового значения
threshold_value = int(input("Введите пороговое значение: "))

# Получаем список без чисел меньше порога
result_list = remove_less_than(number_list, threshold_value)

print("Числа, превышающие порог:", result_list)