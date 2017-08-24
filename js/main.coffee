---
---

window.addEventListener 'load', (e)-> onHashChange(e)
window.addEventListener 'hashchange', (e)-> onHashChange(e)

post = document.querySelector '.ld-post'

onHashChange = ->
	closePost()
	return if location.hash is '' or location.hash is '#'
	url = '{{ site.baseurl }}' + location.hash.substr(1) + '.html'
	$http.get url, (data) ->
		return if not data
		setPost data

openPost = ->
	post.classList.add 'open'

closePost = ->
	post.classList.remove 'open'

setPost = (data) ->
	return closePost() if not data
	post.innerHTML = data
	openPost()