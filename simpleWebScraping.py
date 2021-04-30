#! /usr/bin/env python3

import sys
import urllib.request

if len(sys.argv) < 2:
    print("Specify SAMPLE_LIST_FILE as input")

url = "https://www.ncbi.nlm.nih.gov/sra/?term="
end_keyword = '</a>'
start_keyword = '"Link to BioSample">'

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
            loc = htmlStr.find(start_keyword)
            info = "Not found"
            if loc >= 0:  # find the loc of keyword
                htmlStr1 = htmlStr[loc+len(start_keyword):]
                info = htmlStr1[:htmlStr1.find(end_keyword)]
            print(sample_name + '\t' + info)
            of.write(sample_name + '\t' + info)
