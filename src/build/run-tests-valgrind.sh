set -e

echo "The script you are running has basename `basename "$0"`, dirname `dirname "$0"`"
echo "The present working directory is `pwd`"

CWD=`dirname "$0"`
echo $CWD
cd $CWD

# Shell needs to be overridden for output tests, as `esy` may override it.
export SHELL=/bin/bash

ls
echo "- Starting API tests"
for file in ./*.test-valgrind.exe;
do
      echo "-- Running test $file"
      valgrind --error-exitcode=1 "$file"
      echo "-- Test complete"
done
echo "- API tests complete!"
