---
layout: post
comments: true
title: How did I setup Jekyll?
description: Blog post giving description on how did I setup my whole jekyll blog.
categories: Tutorials
tags: blog Jekyll
image: #/public/img/how-did-i-setup-jekyll/
---
Hi everyone!

So, in the previous post I told you that I shifted to Jekyll and I found it very interesting, building up my own theme, adding many features to the plain blog, exporting the blog posts from Wordpress to Jekyll. The things kept me busy these days and learnt a lot about Ruby and Ruby on Rails. I am gonna tell what I all did for setting up my blog.

### #1

So, the first task was to host my blog in differnt domain. As my portfolio website already lies in [vchrombie.github.io](https://vchrombie.github.io) so there is no chance of hosting my blog over there. So, I need to host my blog is some other repository and map it github pages.

1. Create a new repository, `blog` and clone it and then move into the folder.

    <p align="center">
      <img title="" src="/blog/public/img/how-did-i-setup-jekyll/img1.png" alt="" style="border: 1px solid">
    </p>

    ```bash
    git clone https://github.com/username/blog/
    cd blog
    ```

2. Create a new branch with the name `gh-pages`. (Note: It is compulsory, else the jekyll gem doesn't recognize the codebase.)
    ```bash
    git checkout -b gh-pages
    ```

3. Add all the files to the repository. If you are creating a new blog, try referring to the [jekyll      docs](https://jekyllrb.com/docs/quickstart/)

4. As you are hosting your blog in another repository rather than the `username.github.io`, you must be very    careful in setting up few things in `_config.yml` like the `site.baseurl` and `site.url`

    ```yml
    url:              "http://username.github.io"
    baseurl:          "/blog"
    ```

    The below picture gives you a good understanding of what those terms mean.

    <p align="center">
      <img title="" src="/blog/public/img/how-did-i-setup-jekyll/img2.png" alt="" style="border: 1px solid">
    </p>

    If you are setting up your `username.github.io` as your blog, then your configrations should be like

    ```yml
    url:              "http://username.github.io"
    baseurl:          "/"
    ```

5. And that's it. You can jsut check your blog by deploying it locally and then push it github if you find everything if Ok. 👍

6. Enable GitHub pages for the `gh-pages` branch.

    <p align="center">
      <img title="" src="/blog/public/img/how-did-i-setup-jekyll/img3.png" alt="" style="border: 1px solid">
    </p>


### #2

The second big thing was finding the impressive blog layout. You can use [jekyll themes](https://jekyllrb.com/docs/themes/) which are available on the internet. I wanted a blog layout with fixed side navigation bar and many cool features like portfolio, archives, tags, categories and personal pages. But, there was no theme which matched my requirements and interests. So, I decided to create my own theme with all my required functionalities.

Creating a blog layout was time taking thing, so I used the [Hyde](http://hyde.getpoole.com/) theme and started my work.

- Redesigned the side navbar. Changed the fonts and wrote up new content with title, tagline and short intro.
- Formatted the blog layout as listing posts instead of reading whole blog layout. Implemented the blog excerpt using the `truncate` function.
- Using Ruby and liquid template language, I created [archives](https://vchrombie.github.io/blog/archive/), [tags](https://vchrombie.github.io/blog/tags/) and [categories](https://vchrombie.github.io/blog/categories/) pages.
- Added three more personal pages
  - [About](https://vchrombie.github.io/blog/about/)
  - [Work](https://vchrombie.github.io/blog/work/)
  - [Wall](https://vchrombie.github.io/blog/wall/)
- Integrated [Disqus](https://disqus.com/) comments to blog posts.
- Using liquid syntax, created shortcuts for the next and previous blog posts in each post.
- Integrated sharing buttons for Twitter and Facebook.
- Integrated Google Analytics and SEO.

So, I finally implemented all the required features.

![img](/blog/public/img/how-did-i-setup-jekyll/img4.png)

### #3

The final thing left was to import the existing Wordpress blogs to jekyll as I don't want to lose them. So, I copied the code format of the blog and copied and translated it to markdown. (big process but thansk to atom, I could do that really fast using the editor)

And that's it, everything was done and my blog is live now at https://vchrombie.github.io/blog/. So do visit it and if possible pop a mail/ping me to me suggesting some new features and if any bugs/typos if you encounter with.

Cheers.
