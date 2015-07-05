qqq.q: www toolkit for q
========================

This is an experiment in making it really fast to develop apps in Q/Kdb+,
a programming environment produced by (Kx Systems)[http://kx.com].

WARNING: This software does not yet work. This is just a sketch.

Notes/thinking/observations
---------------------------

Example single pager:

```
save: {reggedat:.z.P;
	`users insert (x.name;reggedat);
	div[`banner;"Welcome, you are user #",(string count users),"!"]
}
div (`banner;"Please login")
itext (`name; (`blur`placeholder)!(save;"Enter your username"))
.qqq.boot[]
```

It outputs:

```html
<header-stuff/>
<script src="qqq.js"></script>
<input type="text" name="name" id="qqq-name" 
	placeholder="Enter your username">
<script>
qqq.bind('name')
</script>
<other-content/>
<script>
// and later:
qqq.boot()
</script>
```

Need to figure out
------------------

How do we namespace "components" so I can compose pieces of the page into
a single unit, as a kind of programmatic "atomic design"?

TODO
----

Everything

Flexible calling syntax
-----------------------

This allows us to get around the fact that Q doesn't allow optional arguments;
use a list as the argument list.

```
func:{x[0] + x[1]}
func(1;2) = func[(1;2)]
```

Handlers on elements
--------------------

Let's try a pub-sub system based on Q symbol names - this can be tied easily to
Q variables or functions.
