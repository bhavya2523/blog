---
layout: post
comments: true
title: Switching from Wordpress to Jekyll
description: Inspired by many developers, I decided to abandon Wordpress and give Jekyll a try. This blog post gives your a brief description of the procedure.
categories: Tutorial
tags: Jekyll Wordpress blog
image: /public/img/switching-to-jekyll/wordpress-to-jekyll.png
---
Hello Everyone,

Inspired by many developers, I decided to abandon Wordpress and give Jekyll a try. I wish much more coding where I do that part and I could design my own pages. So I am changing my blog with newer and better version of the blog posts and many other features. I can confidently say that I could not be happier about this decision.

“So what’s wrong with Wordpress and good with Jekyll?” You may ask. Let’s see, everything.

- Wordpress is a bloated, clunky, slow, vulnerable, closed mess.
- Jekyll is simple, staic, secure and swift.

## Jekyll <3

Jekyll describes itself as a tool for building “Simple, blog-aware, static sites”, and was originally written by one of the Github co-founders, Tom Preston-Werner. It is flat and transparent: Your blog workspace is a single folder with a config file, and a few folders for CSS and HTML templates. All my content, for example, lives in two folders:

1. My blog posts are just files in a single folder `_posts`, written in Markdown. Including this post, of course.
2. My images are in a single folder `public/img`
.
That’s it. You call `$ jekyll serve` from command line and it will automatically render all posts it finds in your `_posts` folder from markdown to HTML, wraps it with header/footer templates, creates the parent index page that lists all your posts and outputs everything into a directory `_site`. The `_site` directory holds your entire webpage as static content. It can then be uploaded to a webserver wherever you like.

The entire code base consists of very few files. It’s easy to see how the HTML templates get composed to your final site. It’s trivial to tweak the CSS or any of the HTML templates. For example, I added Google Analytics tracking code to all my pages by tweaking the html template, and also Disqus comments to all my posts by tweaking the posts template with the Disqus Javascript code.

## Github integration

Lastly, as you might expect Jekyll is tightly integrated with Github: create a repository that looks like `username.github.io` and add your files to the repo. Github will automatically compile your files with Jekyll and make the `_site` folder available. For example, have a look at  [krish-iyer.github.io](https://krish-iyer.github.io/). Thus, Github makes sure that your blog is beautifully backed up forever in simple markdown, and also hosts your content!


### Example workflow

To give a flavor for the workflow, to add a new blog post I proceed as follows:

```bash
$ cd _posts
$ vim 2017-06-24-my-first-blog-post.md
```

Now we write the blog post in markdown, here’s an example file:

```markdown
---
layout: post
title:  "My First Blog Post!"
---

Hello world, this is **markdown**.
```
Lets pop back out to console now. I could preview the changes in a local webserver with `$ jekyll serve --watch` (the watch switch refreshes any updated files as you write them). Now let’s just push it live:

```bash
$ cd ..
$ git add .
$ git commit -m "new blog post"
$ git push
```

After the last command, Github will see that my repo has changed and automatically refreshes `username.github.io` to point to the newly generated `_site`. The post will be live!

I will be coming up with a new blog post where I will tell how did I customize and built my own jekyll blog. Anyway, that’s just a brief taste. Check out Jekyll and get blogging in a sane way!
