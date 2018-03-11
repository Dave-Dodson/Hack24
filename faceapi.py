#!/usr/bin/env python

import requests

url = "https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect?/returnFaceId=true&returnFaceLandmarks=false"

headers = {
  'ocp-apim-subscription-key': "e2b1a810a28b406da79579073fea0009",
  'Content-Type': "application/octet-stream",
  'cache-control': "no-cache",
}

data = open('dist/faceapi/face.jpeg', 'rb').read()
print(type(data))

response = requests.post(url, headers=headers, data=data)

text_file = open("output.txt", "w")

text_file.truncate();

text_file.write(response.text)

text_file.close()

