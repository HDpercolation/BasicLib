# -------MakeGraph.jl--------
# 2016/3/28 by Zhang Yanbo
# 用以构建随机网格


#基础节点类型
type GraphNode
	links
	visitedQ
	color
end

#构建节点
function makeNode(d)
	GraphNode(falses(d), falses, Int32(0))
end

#设置随机边
function makeNDGraph(d, m, p)
	g0 = [makeNode(2 * d) for i = 1:m^d]

	gp = Float32(0.0);

	for i = 1:m^d, j = 1:d
		if rand() < p
			g0[i].links[j] = true;
		end
	end

	ds = Array(Int64, d);
	ds[:] = m;

	return reshape(g0, ds...)
end