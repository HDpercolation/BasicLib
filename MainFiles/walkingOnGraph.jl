# -------walkingOnGraph.jl--------
# 2016/3/28 by Zhang Yanbo
# 用以在图上进行基本的操作

include("basicTypes.jl")

#获得图g的index位置节点
function getNode(g::Graph, index...)
	return g.GraphNodes[index...]
end

#测试某方向是否连接，正为正方向，负为负方向
function linkTest(g::Graph, bond::Int, index)
	in_index = index
	in_bond = abs(bond)

	#用以处理反向边
	if bond < 0
		in_index[in_bond] += -1 + g.m
		in_index[in_bond] %= g.m
		if in_index[in_bond] == 0
			in_index[in_bond] = g.m
		end
	end

	return g.GraphNodes[in_index...].links[abs(bond)]
end
