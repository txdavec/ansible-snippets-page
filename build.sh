#!/bin/bash
#-------------------------------------------------------------------------------
# Simple bash script to create a web page of ansible snippets using 
# an html/css accordion
# Accordion code courtesy of: https://www.w3schools.com/
#
# Created in 2019 by Dave Chouinard
#-------------------------------------------------------------------------------

MODULES='apt assert blockinfile command copy cron debug fail file git group lineinfile mount package pause pip script service set_fact shell stat template unarchive user wait_for wait_for_connection yum'
ALT_ROW='even'
cat begin.html
for MODULE in ${MODULES}
do
  echo "<button class=\"${ALT_ROW} accordion\">${MODULE}</button>"
  echo '<div class="panel">'
  echo "Ansible Doc: <a target=\"_blank\" href=\"https://docs.ansible.com/ansible/latest/modules/${MODULE}_module.html\">${MODULE}</a>"
  echo '<pre>'
  ansible-doc -s ${MODULE}
  echo '</pre>'
  echo '</div>'
  if [[ "${ALT_ROW}" == "even" ]]; then
    ALT_ROW='odd'
  else
    ALT_ROW='even'
  fi
done
cat end.html

exit 0
