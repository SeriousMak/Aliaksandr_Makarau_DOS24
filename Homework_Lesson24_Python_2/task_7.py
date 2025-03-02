#Скрипт, который принимает на вход два списка, находит их общие элементы и создаёт новый список, содержащий только уникальные элементы.

def process_lists(list1, list2):
    common = []  #общие
    unique = []  #уникальные

    # Поиск общих элементов (без дубликатов)
    for item in list1:
        if item in list2 and item not in common:
            common.append(item)

    # Поиск уникальных элементов
    for item in list1 + list2:
        if (list1 + list2).count(item) == 1:
            unique.append(item)

    print("Общие элементы:", common)
    print("Уникальные элементы:", unique)

# Пример использования
list1 = input("Введите элементы первого списка через пробел: ").split()
list2 = input("Введите элементы второго списка через пробел: ").split()

process_lists(list1, list2)