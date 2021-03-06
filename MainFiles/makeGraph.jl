# -------MakeGraph.jl--------
# 2016/3/28 by Zhang Yanbo
# 用以构建随机网格

include("basicTypes.jl")

#构建节点
function makeNode(d::Int)
	GraphNode(falses(d), falses, 0)
end

#设置随机边
function makeNDGraph(d::Int, m::Int, p::Float64)
	g0 = [makeNode(d) for i = 1:m^d]

	for i = 1:m^d, j = 1:d
		if rand() < p
			g0[i].links[j] = true
		end
	end

	ds = Array(Int64, d)
	ds[:] = m

	return Graph(reshape(g0, ds...), d, m)
end
