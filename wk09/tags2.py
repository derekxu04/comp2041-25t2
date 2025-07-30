#! /usr/bin/env python3

# fetch specified web page and count the HTML tags in them

import subprocess, re
from collections import Counter
from argparse import ArgumentParser

def main():
    # frequency = False
    # if len(sys.argv) == 1:
    #     url = sys.argv[1]
    # else:
    #     frequency = True
    #     url = sys.argv[2]
    # url = sys.argv[1]

    parser = ArgumentParser()
    parser.add_argument("-f", "--frequency", action="store_true", help="print tags by frequency")
    parser.add_argument("url", help="url to fetch")
    args = parser.parse_args()

    # Fetch html
    process = subprocess.run(
        ["wget", "-q", "-O-", args.url],
        capture_output=True,
        text=True,
    )
    webpage = process.stdout

    # find tags
    tags = re.findall(r'<(\w+)', webpage)

    # count tags
    tags_counter = Counter(tags)

    if args.frequency:
        for tag, count in reversed(tags_counter.most_common()):
            print(tag, count)
    else:
        # print alphabetically
        for tag, count in sorted(tags_counter.items()):
            print(tag, count)

if __name__ == "__main__":
    main()