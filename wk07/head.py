#! /usr/bin/env python3

import sys 

def main():
    # Figure out how many lines to print
    n = 10
    if len(sys.argv) > 1:
        if sys.argv[1].startswith('-'):
        # if sys.argv[1][0] == '-':
            # n = int(sys.argv[1][1:])
            # sys.argv.pop(1)

            n = int(sys.argv.pop(1)[1:])

    if len(sys.argv) > 1:
        for file in sys.argv[1:]:
            # print("==> " + file + " <==")
            print(f"==> {file} <==")

            # stream = open(file)

            try:
                with open(file, "r") as stream:
                    i = 1
                    for line in stream:
                        if i > n:
                            break
                        print(line, end="")
                        i += 1
            except IOError as e:
                print("Error:", e)

            # stream.close()
    else:
        i = 1
        for line in sys.stdin:
            if i > n:
                break
            print(line, end="")
            i += 1

if __name__ == "__main__":
    main()