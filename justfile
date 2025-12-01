default:
  just --list

answer day part: (_run day part)

sample day part: (_run day part 'sample')

_run day part suffix='':
  @ruby bin/day{{ day }}-{{ part }}.rb < data/day{{ day }}{{ if suffix != '' { prepend('-', suffix)} else { '' } }}.txt

