# This file demonstrates a problem that was introduced between Docker 0.6.6 and 0.7.1.
#
# To reproduce:
# 1. Make a Dockerfile that RUNs something that prints partial lines (without LF) to stdout,
#    then prints a subsequent line feed. (This script does that. So does Ruby's `bundle install` command).
# 2. docker build
#
# RESULT:   `docker build` prints each line, but then replaces it with a blank line when
#           the LF is printed. For example, after the first two echoes have executed
#           and while the third command is still waiting, the output looks like this
#           (underscore represents the cursor location):
#
#             $ docker build .
#
#
#             _Nor this one...
#
# EXPECTED: The previous lines of output should not be cleared:
#
#             $ docker build .
#             This line should not be erased...
#             Neither should this line...
#             Nor this one..._
#

echo -n This line should not be erased... 
sleep 1
echo

echo -n Neither should this line... 
sleep 1
echo

echo -n Nor this one... 