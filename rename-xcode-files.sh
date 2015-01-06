#!/bin/bash

PROJECT_DIR=.
RENAME_CLASSES=rename_classes.txt

#First, we substitute the text in all of the files.
sed_cmd=`sed -e 's@^@s/[[:<:]]@; s@[[:space:]]\{1,\}@[[:>:]]/@; s@$@/g;@' ${RENAME_CLASSES} `
find ${PROJECT_DIR} -type f \
    \( -name "*.pbxproj" -or -name "*.h" -or -name "*.m" -or -name "*.xib" -or -name "*.storyboard" \) \
    -exec sed -i.bak "${sed_cmd}" {} +

# Now, we rename the .h/.m files
while read line; do
    class_from=`echo $line | sed "s/[[:space:]]\{1,\}.*//"`
    class_to=`echo $line | sed "s/.*[[:space:]]\{1,\}//"`
    find ${PROJECT_DIR} -type f -regex ".*[[:<:]]${class_from}[[:>:]][^\/]*\.[hm]" -print | egrep -v '.bak$' | \
    while read file_from; do
         file_to=`echo $file_from | sed "s/\(.*\)[[:<:]]${class_from}[[:>:]]\([^\/]*\)/\1${class_to}\2/"`
         echo mv "${file_from}" "${file_to}"
         mv "${file_from}" "${file_to}"
    done
done < ${RENAME_CLASSES}
