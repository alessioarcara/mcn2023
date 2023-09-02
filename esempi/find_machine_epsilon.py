def find_machine_epsilon():
    u = 1
    while u + 1 > 1:
        u = u / 2
    return u * 2