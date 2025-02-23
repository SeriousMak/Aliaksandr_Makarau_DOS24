# Принимает на вход список файлов и находит те, которые встречаются в обеих строках

def find_files_with_sub(file_list, substring):
    matching_files = [file for file in file_list if substring in file]
    return matching_files


files = ['data_analysis.docx', 'summary.pdf', 'data_analysis.csv', 'final_report.docx']
substring = 'data'
found_files = find_files_with_sub(files, substring)

print('Найденные файлы:', found_files)