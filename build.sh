#!/bin/bash
MODULES='apt blockinfile command copy cron debug file group lineinfile mount package pip script service shell stat template unarchive user yum'
echo '<html>'
for MODULE in ${MODULES}
do
  echo "<br/><hr/><h3><a href=\"https://docs.ansible.com/ansible/latest/modules/${MODULE}_module.html\">${MODULE}</a></h3><pre>"
  ansible-doc -s ${MODULE}
  echo '</pre>'
done
echo '</html>'
