---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
description: ""
summary: ""

# Blog Meta
author: "{{ .Site.Params.author | default "Matt Spurlin" }}"
tags: []
categories: ["blog"]
series: ""

# Retro Web Styling
retro_style: "blog"
pixel_perfect: true
show_reading_time: true
show_tags: true
enable_comments: false

# Featured Content
featured: false
featured_image: ""

# SEO & Social
keywords: []
canonical_url: ""
---

<!-- 📝 Blog Post Template -->

## Introduction

Your blog post content starts here...

## Main Content

Use PICO-8 components to enhance your content:

{{< p8-info >}}
This is an info box using the PICO-8 design system!
{{< /p8-info >}}

{{< p8-code lang="javascript" >}}
// Your code here
console.log("Hello PICO-8 Web!");
{{< /p8-code >}}

## Conclusion

Wrap up your thoughts here.

---

*Happy coding! 🎮* 