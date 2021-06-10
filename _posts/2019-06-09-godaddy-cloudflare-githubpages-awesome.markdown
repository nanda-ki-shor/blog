---
layout: post
title:  "Godaddy + Cloudflare + Github Pages = Awesome"
date:   2019-06-09 23:00:00 +0530
categories: cloudflare jekyll
permalink: 2019-06-09-godaddy-cloudflare-githubpages-awesome
---
After a really long gap, I have started blogging again. Here is how this blog is created (how meta!!!).

* [Github Pages][ghpages] hosting the content.
* [Jekyll][jekyll] as the static site generator.
	* [Plainwhite Jekyll theme][theme].
* [Godaddy][godaddy] as the Domain host.
* [Cloudflare][cloudflare] for all the nameservers and origin protection.
* [Disqus][disqus] for all commenting support.

Here is a detailed description of how all the above dots are connected.

1. Create an empty repo called `blog` and navigate to repo `Settings` page.
2. Enable `Github Pages` for this repo by filling all the required fields. You can select any theme from the available list.
![Github Pages screenshot](/assets/github-pages-settings.png)
3. Purchase a domain of your liking from Godaddy. Ignore the nameservers and other DNS settings in `Manage DNS` screen for now. We will revisit this shortly.
4. Signup for a Cloudflare account and click on `Add a Site`.
5. Mention the same site you have purchased from Godaddy and start setting up the `DNS` records in Cloudflare.
6. Setup `A` records in Cloudflare as mentioned in this [github pages help page][setup-apex-domain]. TTL could be 5 mins.
7. Setup `CNAME` record with Name : `www` pointing to <yourgithub-handle>.github.io. TTL could be 5 mins.
8. Make a note of Nameservers mentioned in Cloudflare.
9. Go to Godaddy `Manage DNS` page for the purchased site and add the nameservers noted above.
10. Here's how we verify if the domain and the blog are connected properly or not.
	~~~
	$ dig +noall +answer <your domain>
	<your domain>.		300	IN	A	104.27.XXX.YYY
	<your domain>.		300	IN	A	104.27.ZZZ.AAA

	$ dig +noall +answer <yourgithub-handle>.github.io
	<yourgithub-handle>.github.io.	3600	IN	A	185.199.108.153
	<yourgithub-handle>.github.io.	3600	IN	A	185.199.109.153
	<yourgithub-handle>.github.io.	3600	IN	A	185.199.110.153
	<yourgithub-handle>.github.io.	3600	IN	A	185.199.111.153
	~~~

11. Incase you are wondering why the first `dig` is giving you different IP compared to the second `dig`, its because Cloudflare is masquerading your origin (in this case: github.io) and protecting it against all DDoS attacks. Claps!

12. Navigate to <your domain> and find the placeholder content from github pages.
13. Github Pages' static page is meant for a single page blog and not for adding multiple blogs, categories, tags, comments etc.. Thats where Jekyll comes. More on that in the upcoming blog.

---
Like this post ? or No ? Leave a reaction below.

[jekyll]: https://jekyllrb.com/
[theme]: https://github.com/samarsault/plainwhite-jekyll
[ghpages]:   https://pages.github.com/
[godaddy]:   https://godaddy.com/
[cloudflare]:   https://cloudflare.com/
[disqus]: https://disqus.com
[setup-apex-domain]: https://help.github.com/en/articles/setting-up-an-apex-domain#configuring-a-records-with-your-dns-provider
