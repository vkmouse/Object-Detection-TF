import sys

classes = []
with open(sys.argv[1], 'r') as file:
    classes = file.readlines()

with open(sys.argv[2], 'w') as file:
    for i in range(len(classes)):
        file.write('item {\n')
        file.write('    id: %d\n' % (i + 1))
        file.write('    name: \'%s\'\n' % classes[i])
        file.write('}\n')
