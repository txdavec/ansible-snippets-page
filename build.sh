#!/bin/bash
#-------------------------------------------------------------------------------
# Simple bash script to create a web page of ansible snippets using 
# an html/css accordion
# Accordion code courtesy of: https://www.w3schools.com/
#
# Copyright 2019 Dave Chouinard
# MIT License
#-------------------------------------------------------------------------------

MODULES='apt blockinfile command copy cron debug file group lineinfile mount package pip script service shell stat template unarchive user yum'
cat begin.html
for MODULE in ${MODULES}
do
  echo "<button class=\"accordion\">${MODULE}</button>"
  echo "<div class=\"panel\"><p><a target=\"_blank\" href=\"https://docs.ansible.com/ansible/latest/modules/${MODULE}_module.html\">${MODULE}</a><pre>"
  ansible-doc -s ${MODULE}
  echo '</pre></p></div>'
done
cat end.html

exit 0
