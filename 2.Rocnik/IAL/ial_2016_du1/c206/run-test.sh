#!/bin/bash

# --------------------------- #
# Run make before this script #
# --------------------------- #

PRJ=c206

# Check binary files
if ! [ -a $PRJ-test ];
then
    echo "ERROR:" $PRJ-test "binary file not found, run make";
    exit 1;
fi

if ! [ -a $PRJ-advanced-test ];
then
    echo "ERROR:" $PRJ-advanced-test "binary file not found, run make";
    exit 1;
fi

if ! [ -a $PRJ-advanced-test2 ];
then
    echo "ERROR:" $PRJ-advanced-test2 "binary file not found, run make";
    exit 1;
fi

# BASIC TEST
./$PRJ-test >$PRJ-test-my.out
diff $PRJ-test.output $PRJ-test-my.out >$PRJ-test-diff.out
if [ -s $PRJ-test-diff.out ];
then
    echo -e "---------------\nFAILED: Basic test -" $PRJ-test-diff.out "\n---------------";
else
    echo -e "---------------\nOK: Basic test\n---------------";
fi

# ADVANCED TEST
./$PRJ-advanced-test >$PRJ-advanced-test-my.out
diff $PRJ-advanced-test.output $PRJ-advanced-test-my.out >$PRJ-advanced-test-diff.out
if [ -s $PRJ-advanced-test-diff.out ];
then
    echo -e "------------------\nFAILED: Advanced test -" $PRJ-advanced-test-diff.out "\n------------------";
else
    echo -e "------------------\nOK: Advanced test\n------------------";
fi

# ADVANCED TEST 2
./$PRJ-advanced-test2 >$PRJ-advanced-test2-my.out
diff $PRJ-advanced-test2.output $PRJ-advanced-test2-my.out >$PRJ-advanced-test2-diff.out
if [ -s $PRJ-advanced-test2-diff.out ];
then
    echo -e "------------------\nFAILED: Advanced test 2 -" $PRJ-advanced-test2-diff.out "\n------------------";
else
    echo -e "------------------\nOK: Advanced test 2\n------------------";
fi
