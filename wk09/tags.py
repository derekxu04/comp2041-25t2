#! /usr/bin/env python3

# fetch specified web page and count the HTML tags in them

import sys, subprocess, re
from collections import Counter
# import subprocess

def main():
    url = sys.argv[1]
    
    # Fetch html
    process = subprocess.run(
        ["wget", "-q", "-O-", url],
        capture_output=True,
        text=True,
    )
    webpage = process.stdout

    # find tags
    tags = re.findall(r'<(\w+)', webpage)

    # count tags
    tags_counter = Counter(tags)

    for tag, count in sorted(tags_counter.items()):
        print(tag, count)

    # tags_count = {}
    # for tag in tags:
    #     if tag not in tags_count:
    #         tags_count[tag] = 0
    #     tags_count[tag] += 1

    # print(tags_count)

if __name__ == "__main__":
    main()