#!/bin/bash

COUNTER_SUCCESS=0
COUNTER_FAIL=0
DIFF_RES=""
TEST_FILE=" test.txt test_2.txt"
TEST_FILE2=" test_3.txt test_2.txt"
TEST_FILE3=" bytes.txt bytes2.txt"

for var in -b -e -n -s -t
do
          TEST1="$var $TEST_FILE"
          echo "$TEST1"
          ./s21_cat $TEST1 > s21_cat.txt
          cat $TEST1 > cat.txt
          DIFF_RES="$(diff -s s21_cat.txt cat.txt)"
          if [ "$DIFF_RES" == "Files s21_cat.txt and cat.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST1" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          rm s21_cat.txt cat.txt
done

for var in -b -e -n -s -t
do
          TEST2="$var $TEST_FILE2"
          echo "$TEST2"
          ./s21_cat $TEST2 > s21_cat2.txt
          cat $TEST2 > cat2.txt
          DIFF_RES="$(diff -s s21_cat2.txt cat2.txt)"
          if [ "$DIFF_RES" == "Files s21_cat2.txt and cat2.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST2" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          rm s21_cat2.txt cat2.txt
done

for var in -b -e -n -s -t
do
          TEST3="$var $TEST_FILE3"
          echo "$TEST3"
          ./s21_cat $TEST3 > s21_cat3.txt
          cat $TEST3 > cat3.txt
          DIFF_RES="$(diff -s s21_cat3.txt cat3.txt)"
          if [ "$DIFF_RES" == "Files s21_cat3.txt and cat3.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST3" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          rm s21_cat3.txt cat3.txt
done

###################################################################################################

for var in -b -e -n -s -t
do
  for var2 in -b -e -n -s -t
  do
      if [ $var != $var2 ]
          then
          TEST1="$var $var2 $TEST_FILE"
          echo "$TEST1"
          ./s21_cat $TEST1 > s21_cat.txt
          cat $TEST1 > cat.txt
          DIFF_RES="$(diff -s s21_cat.txt cat.txt)"
          if [ "$DIFF_RES" == "Files s21_cat.txt and cat.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST1" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          rm s21_cat.txt cat.txt
      fi
  done
done

for var in -b -e -n -s -t
do
  for var2 in -b -e -n -s -t
  do
      if [ $var != $var2 ]
          then
          TEST2="$var $var2 $TEST_FILE2"
          echo "$TEST2"
          ./s21_cat $TEST2 > s21_cat2.txt
          cat $TEST2 > cat2.txt
          DIFF_RES="$(diff -s s21_cat2.txt cat2.txt)"
          if [ "$DIFF_RES" == "Files s21_cat2.txt and cat2.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST2" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          rm s21_cat2.txt cat2.txt
      fi
  done
done

for var in -b -e -n -s -t
do
  for var2 in -b -e -n -s -t
    do
      if [ $var != $var2 ]
        then
          TEST3="$var $var2 $TEST_FILE3"
          echo "$TEST3"
          ./s21_cat $TEST3 > s21_cat3.txt
          cat $TEST3 > cat3.txt
          DIFF_RES="$(diff -s s21_cat3.txt cat3.txt)"
          if [ "$DIFF_RES" == "Files s21_cat3.txt and cat3.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST3" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          rm s21_cat3.txt cat3.txt
      fi
  done
done

###################################################################################################

for var in -b -e -n -s -t
do
  for var2 in -b -e -n -s -t
  do
    for var3 in -b -e -n -s -t
      do
        if [ $var != $var2 ] && [ $var2 != $var3 ] && [ $var != $var3 ]
          then
          TEST1="$var $var2 $var3 $TEST_FILE"
          echo "$TEST1"
          ./s21_cat $TEST1 > s21_cat.txt
          cat $TEST1 > cat.txt
          DIFF_RES="$(diff -s s21_cat.txt cat.txt)"
          if [ "$DIFF_RES" == "Files s21_cat.txt and cat.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST1" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          rm s21_cat.txt cat.txt
        fi
    done
  done
done

for var in -b -e -n -s -t
do
  for var2 in -b -e -n -s -t
  do
    for var3 in -b -e -n -s -t
      do
        if [ $var != $var2 ] && [ $var2 != $var3 ] && [ $var != $var3 ]
          then
          TEST2="$var $var2 $var3 $TEST_FILE2"
          echo "$TEST2"
          ./s21_cat $TEST2 > s21_cat2.txt
          cat $TEST2 > cat2.txt
          DIFF_RES="$(diff -s s21_cat2.txt cat2.txt)"
          if [ "$DIFF_RES" == "Files s21_cat2.txt and cat2.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST2" >> log.txt
              (( COUNTER_FAIL++ ))
          fi
          rm s21_cat2.txt cat2.txt
        fi
    done
  done
done

for var in -b -e -n -s -t
do
  for var2 in -b -e -n -s -t
    do
      for var3 in -b -e -n -s -t
        do
          if [ $var != $var2 ] && [ $var2 != $var3 ] && [ $var != $var3 ]
            then
            TEST3="$var $var2 $var3 $TEST_FILE3"
            echo "$TEST3"
            ./s21_cat $TEST3 > s21_cat3.txt
            cat $TEST3 > cat3.txt
            DIFF_RES="$(diff -s s21_cat3.txt cat3.txt)"
            if [ "$DIFF_RES" == "Files s21_cat3.txt and cat3.txt are identical" ]
              then
                (( COUNTER_SUCCESS++ ))
              else
                echo "$TEST3" >> log.txt
                (( COUNTER_FAIL++ ))
            fi
            rm s21_cat3.txt cat3.txt
        fi
    done
  done
done

###################################################################################################

for var in -b -e -n -s -t
do
  for var2 in -b -e -n -s -t
  do
    for var3 in -b -e -n -s -t
      do
        for var4 in -b -e -n -s -t
          do
            if [ $var != $var2 ] && [ $var2 != $var3 ] && [ $var != $var3 ] && [ $var != $var4 ] && [ $var2 != $var4 ] && [ $var3 != $var4 ]
              then
                TEST1="$var $var2 $var3 $var4 $TEST_FILE"
                echo "$TEST1"
                ./s21_cat $TEST1 > s21_cat.txt
                cat $TEST1 > cat.txt
                DIFF_RES="$(diff -s s21_cat.txt cat.txt)"
                if [ "$DIFF_RES" == "Files s21_cat.txt and cat.txt are identical" ]
                  then
                    (( COUNTER_SUCCESS++ ))
                  else
                    echo "$TEST1" >> log.txt
                    (( COUNTER_FAIL++ ))
                fi
                rm s21_cat.txt cat.txt
            fi
      done
    done
  done
done

for var in -b -e -n -s -t
do
  for var2 in -b -e -n -s -t
  do
    for var3 in -b -e -n -s -t
      do
        for var4 in -b -e -n -s -t
          do
            if [ $var != $var2 ] && [ $var2 != $var3 ] && [ $var != $var3 ] && [ $var != $var4 ] && [ $var2 != $var4 ] && [ $var3 != $var4 ]
              then
                TEST2="$var $var2 $var3 $var4 $TEST_FILE2"
                echo "$TEST2"
                ./s21_cat $TEST2 > s21_cat2.txt
                cat $TEST2 > cat2.txt
                DIFF_RES="$(diff -s s21_cat2.txt cat2.txt)"
                if [ "$DIFF_RES" == "Files s21_cat2.txt and cat2.txt are identical" ]
                  then
                    (( COUNTER_SUCCESS++ ))
                  else
                    echo "$TEST2" >> log.txt
                    (( COUNTER_FAIL++ ))
                fi
                rm s21_cat2.txt cat2.txt
            fi
      done
    done
  done
done

for var in -b -e -n -s -t
do
  for var2 in -b -e -n -s -t
    do
      for var3 in -b -e -n -s -t
        do
          for var4 in -b -e -n -s -t
            do
              if [ $var != $var2 ] && [ $var2 != $var3 ] && [ $var != $var3 ] && [ $var != $var4 ] && [ $var2 != $var4 ] && [ $var3 != $var4 ]
                then
                TEST3="$var $var2 $var3 $var4 $TEST_FILE3"
                echo "$TEST3"
                ./s21_cat $TEST3 > s21_cat3.txt
                cat $TEST3 > cat3.txt
                DIFF_RES="$(diff -s s21_cat3.txt cat3.txt)"
                if [ "$DIFF_RES" == "Files s21_cat3.txt and cat3.txt are identical" ]
                  then
                    (( COUNTER_SUCCESS++ ))
                  else
                    echo "$TEST3" >> log.txt
                    (( COUNTER_FAIL++ ))
                fi
                rm s21_cat3.txt cat3.txt
            fi
      done
    done
  done
done

echo "SUCCESS: $COUNTER_SUCCESS"
echo "FAIL: $COUNTER_FAIL"

