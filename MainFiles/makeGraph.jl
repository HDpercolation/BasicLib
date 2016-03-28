
type GraphNode
	links
	visitedQ
	color
end

function makeNode(d)
	GraphNode(falses(d), falses, Int32(0))
end

function makeNDGraph(d, m, p)
	g0 = Array(GraphNode, m^d);
	g0[:] = makeNode(2 * d);

	gp = Float32(0.0);

	for i = 1:m^d, j = 1:d
		if rand() < p
			g0[i].links[j] = true;
		else
			g0[i].links[j] = false;
		end
	end

	ds = Array(Int64, d);
	ds[:] = m;

	return reshape(g0, ds...)
end

function randomLink(d, p)
	l = falses(d);
	for i = 1:d
		if (rand() < p)
			l[i] = true
		else
			l[i] = false
		end
	end
	return l
end

type Graph
	links
end

#此用以构建d维、宽为m的数组
function makeNDArray(d::Int64, m::Int64, ini::DataType)
	dimsx = 0 * Array(Int16, d) + m
	return Array(ini, dimsx...)
end
