---
layout: post
comments: true
title: easy peasy, lemon squeezy
description: A blog post to show few of the automation stuff I made to make my life easy.
categories: Techie
tags: ComputerHacks MakeLifeEasy
image: #/public/img/easy-peasy-lemon-squeezy/
---
Hi all!

I am back with one more post. You all know that  moved from Wordpress to Jekyll only because jekyll is easy to use. But, I find the jekyll are also boring. I created some cool automations for the jekyll posts in order to make my life more easy.

So, the steps to create a blog post in jekyll are
1. Create a new file with the slug in the name format "YYYY-MM-DD-SLUGNAME.md"
2. Add the intial content to the blog post.
    ```markdown
    ---
    layout: post
    comments: true
    title: {TODO1}
    categories: {TODO2}
    tags: {TODO3}
    image: {TODO4}
    ---
    ```
3. Create a image directory for the respective blog post in `public/img/`
4. Open the blog post and write the content.
5. Check the blog post by running it locally.
6. Push the blog post to GitHub.

Huh, such long and tiring procedure right. So, I really wanted to automate this whole thing. My laziness can't accept this much work. So, I took this as a challenge and started figuring out what to do and how to do.

The first step I took was I divided the whole procedure into three parts, BEFORE writing the content and AFTER writing the content and writing the content as I can't automate this unless I create a `thought to text` converter. I need to automate the rest two. I was working with ruby these days, so I thought of using ruby. (PS: Ruby is no less than Python)

My plan was doing everything which is possible, in ruby and later run that script using shell scripting.

### BEFORE writing the content

1. Create a new file with the slug in the name format "YYYY-MM-DD-SLUGNAME.md". This was pretty easy for me. I was asked the user to input only SLUGNAME as the date can be scrapped and using d=string formations, you can get the required file name. The required file can be created by opening it in `write` mode.

    ```ruby    
    puts "Enter the permalink you want"
    name = gets.chomp

    require 'date'

    POSTS_DIR = "_posts"

    file_name = "#{Date.today.iso8601}-#{name}.md"
    file_path = "#{POSTS_DIR}/#{file_name}"

    puts "CREATED #{file_name}"

    filout = File.open(file_path, "w")
    ```

2. Add the intial content to the blog post. I found this file operation, `FileObject << "STRING"` in the ruby docs for file handling which can write the `STRING` in the file opened by the `FileObject`

    ```ruby
    filout = File.open(file_path, "w")

    filout << "---
    layout: post
    comments: true
    title:
    description:
    categories:
    tags:
    image: #/public/img/#{name}/
    ---\n\n"

    filout.close()

    puts "TEMPLATE inserted in #{file_path}"
    ```
3. Create a image directory for the respective blog post in `public/img/`. I thought of creating the SLUGNAME which we gave as input in the first step as the folder name so that it will be well organized. I wrote the below script for the same.

    ```ruby
    image_dir = "public/img/#{name}"
    if Dir.exists? image_dir
        unless File.exists? "#{image_dir}/"
        end
    else
        Dir.mkdir("public/img/#{name}")
    end

    puts "IMAGE DIRECTORY created in /public/img/#{name}"
    ```
Now that the three steps are completed, I wrote a shell script, `newpost.sh` as:

```bash
ruby scripts/new-post.rb
atom _posts/`ls -t _posts | head -n1`
```

The first line executes the ruby script which I have written just before and the second line opens the recently created file in the atom editor. So, after running the script, I just need to input the SLUGNAME and the post will be opened right in front of me, ready to be edited in atom.

<p align="center">
  <img title="" src="/blog/public/img/easy-peasy-lemon-squeezy/img1.png" alt="" style="border: 1px solid">
</p>
<p align="center">
  <img title="" src="/blog/public/img/easy-peasy-lemon-squeezy/img2.png" alt="" style="border: 1px solid">
</p>

### AFTER writing the content

5. Check the blog post by running it locally. Before checking, I wanted to remove to remove the useless folders.

    ```bash
    echo "Empty image directories are deleted"
    find . -type d -depth -empty -exec rmdir "{}" \;

    echo "BUILDING Blog"
    bundle exec jekyll serve
    ```

6. Push the blog post to GitHub.

    ```bash
    git add .
    git commit -m "added a new blog post"
    git push
    ```

These automations reduce my time for posting a blog post from 5 to 1 minutes. Though the time difference is small and negligable, I am interested in automating the stuff according to my convinience and every minute is valuable.

You can find the code of the scripts I have written for the blog posts here https://github.com/vchrombie/blog/tree/gh-pages/scripts
