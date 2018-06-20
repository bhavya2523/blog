# Ruby script to generate the next file for writing today's post

puts "Enter the permalink you want"
name = gets.chomp

require 'date'

POSTS_DIR = "../_posts"

file_name = "#{Date.today.iso8601}-#{name}.md"
file_path = "#{POSTS_DIR}/#{file_name}"

puts "CREATED #{file_name}"

filout = File.open file_path, "w"

filout << "---
layout: post
comments: true
title:
description:
categories:
tags:
image: #/public/img/
---\n\n"

filout.close()

puts "TEMPLATE inserted in #{file_path}"

image_dir = "../public/img/#{name}"
if Dir.exists? image_dir
    unless File.exists? "#{image_dir}/"
    end
else
    Dir.mkdir("../public/img/#{name}")
end

puts "IMAGE DIRECTORY created in /public/img/#{name}"
