\l qqq.q

t:{[name;res;expect]
	res:raze res;
	show (`teststart;name;res;expect);
	bool:res~expect;
	show $[not bool;[0N!res;'testfailed];(string name),": success"]}

test:{
	attr0:(enlist `href)!enlist "test.html";
	attr1:(enlist `a)!enlist "b";
	STR:.qqq.str;
	TAG:.qqq.tag;
	TAG0:.qqq.tag0;
	t[`str1;STR["name"];"name"];
	t[`strs;STR[`name];"name"];
	t[`strss;STR[`name`name];"namename"];
	t[`strss1;STR[attr0];"href=\"test.html\""];
	t[`strss2;STR[(enlist "a")!enlist "1"];"a=\"1\""];
	t[`strss3;STR[(`a`b)!1 2];"a=\"1\" b=\"2\""];
	t[`strss3;STR[(enlist `aaaa)!enlist 1];"aaaa=\"1\""];
	t[`tag1;TAG0[`a;attr0;"Blah"];"<a href=\"test.html\">Blah</a>"];
	t[`tag2;TAG"Hello";"Hello"];
	t[`tag3;TAG(`a;"Hello");"<a>Hello</a>"];
	t[`tag4;TAG(`a;attr0;"Hello");"<a href=\"test.html\">Hello</a>"];
	t[`tag5;TAG(`a;attr0;"Hello");"<a href=\"test.html\">Hello</a>"];
	t[`tag6;TAG(attr1;"Hello");"<span a=\"b\">Hello</span>"];
	t[`tag3;TAG(`a;(`b;"Hello"));"<a><b>Hello</b></a>"];
	show `testspassed}

test[]
