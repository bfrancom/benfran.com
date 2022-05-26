---
title: Netlify Alert Insecure mixed content detected
image: images/174.jpg
date: 2019-08-07 15:31:00.000000000 -06:00

---

I kept getting these annoying alerts from Netlify on each deploy of my website due to mixing http content with my site that is on https.

![](/content/images/2019/08/netlify-insecure-mixed-content.png)


The logs on the netlify side looked like the following, but with many more:

```
9:09:51 PM: Mixed content detected in: /2005/blender-3d-project-orange/index.html
9:09:51 PM: --> insecure img urls:
9:09:51 PM:   - http://blender3d.org/cms/typo3temp/pics/b03fb21cf2.jpg
9:09:54 PM: Mixed content detected in: /2006/rad-mobile/index.html
9:09:54 PM: --> insecure img urls:
9:09:54 PM:   - http://static.flickr.com/81/230155799_4615e0dc84.jpg?v=0
9:09:54 PM: Mixed content detected in: /2006/the-disney-and-pixar-merger/index.html
9:09:54 PM: --> insecure img urls:
9:09:54 PM:   - http://upload.wikimedia.org/wikipedia/en/5/5e/Pixar.jpg
9:09:54 PM: Mixed content detected in: /2006/ubuntu-dapper-drake/index.html
9:09:54 PM: --> insecure img urls:
9:09:54 PM:   - http://photos1.blogger.com/blogger/3110/487/400/Screenshot.png
9:09:55 PM: Mixed content detected in: /2006/xgl-compiz/index.html
9:09:55 PM: --> insecure img urls:
9:09:55 PM:   - http://files.opensuse.org/opensuse/en/thumb/c/cb/Movie-cube.jpg/350px-Movie-cube.jpg
9:09:55 PM: Mixed content detected in: /2007/cups-error-w2-invalid-pers/index.html
```

## Cause
The cause was links to old images that may or may not still work, but are referenced over http instead of https.

## Solution
Download the log file from Netlify, or copy and paste it into a text file.

Because getting some images is better than nothing, I created a script from the URL's in the log to download any images that still exist into a folder, and create a text file that has a list of these images. I can't find the script I used on this, but if I do, I'll update the post.

Run this fancy (not fancy) script against the text file, which will modify the broken hyperlinks if an image exists.

```
#!/bin/bash
input="/tmp/realImages.txt"
while IFS= read -r line
do
  bob=$(basename $line)
  find . -type f -exec sed -i '' -e "s,$line,/images/old/$bob,g" {} \;
done < "$input"
```
