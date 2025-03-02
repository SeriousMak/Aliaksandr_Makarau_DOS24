#Скрипт, который принимает на вход список строк и сортирует их по длине в порядке возрастания.
def sort_by_length(strings):
    sorted_strings = sorted(strings, key=len)  
    return sorted_strings

strings = input("Введите строки через запятую: ").split(", ")

# Сортировка и вывод результата
sorted_strings = sort_by_length(strings)
print("Отсортированные строки:", sorted_strings)
