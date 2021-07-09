# QUESTION 1

example = [[1, 'a', ['cat'], 2], [[[3]], 'dog'], 4, 5]
flatten_list = []
def flatten(liste):
    for i in liste:
        if type(i) == list:
            flatten(i)
        else:
            flatten_list.append(i)
flatten(example)
print(flatten_list)
flatten_list.clear()


# QUESTION 2

example = [[1, 2], [3, 4], [5, 6, 7]]
def reverseList(l):
    l.reverse()
    for i in l:
        if type(i) == list:
            reverseList(i)
    return l
print(reverseList(example))
