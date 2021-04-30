#! /usr/bin/env python3

import sys
import urllib.request

if len(sys.argv) < 2:
    print("./sampleinfo.py SAMPLE_LIST_FILE")

url = "https://www.ncbi.nlm.nih.gov/sra/?term="
keyword1 = "Instrument:"
keyword2 = "Layout:"
# keyword = "Organism: "
end_tag = "</span>"
start_tag = "span>"


with open(sys.argv[1], 'r') as f:
    with open(sys.argv[1]+".result.txt", 'w') as of:
        for sample_name in f.readlines():
            sample_name = sample_name.strip('\n')
            print("handling " + sample_name)
            request = urllib.request.Request(url+sample_name)
            try:
                response = urllib.request.urlopen(request)
            except:
                print("urlopen error")
            htmlStr = response.read().decode("utf8")
            # start shit
            loc = htmlStr.find(keyword1)
            info1 = "Not found"
            if loc >= 0:  # find the loc of keyword
                loc += len(keyword1)
                htmlStr1 = htmlStr[loc:]
                loc_end = htmlStr1.find(end_tag)
                htmlStr1 = htmlStr1[:loc_end]
                info1 = htmlStr1[htmlStr1.rfind(start_tag)+len(start_tag):]
            # print(sample_name + '\t' + info)
            # of.write(sample_name + '\t' + info + '\n')
            # shit 2
            loc = htmlStr.find(keyword2)
            info2 = "Not found"
            if loc >= 0:  # find the loc of keyword
                loc += len(keyword2)
                htmlStr2 = htmlStr[loc:]
                loc_end = htmlStr2.find(end_tag)
                htmlStr2 = htmlStr2[:loc_end]
                info2 = htmlStr2[htmlStr2.rfind(start_tag)+len(start_tag):]
            print(sample_name + '\t' + info1 + '\t' + info2)
            of.write(sample_name + '\t' + info1 + '\t' + info2 + '\n')
