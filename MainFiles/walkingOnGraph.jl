# -------walkingOnGraph.jl--------
# 2016/3/28 by Zhang Yanbo
# 用以在图上进行基本的操作

#获得图g的index位置节点
getNode(g, index...)
	return g.GraphNodes[index...]
end

#测试某方向是否连接，正为正方向，负为负方向
linkTest(g, bond, index...)
	di = bond > 0 ? 1 : -1
	in_index = index

	in_index[di] += di
	in_index %= g.m
	in_index ++

	return g.GraphNodes[in_index...].links[abs(bond)]
end
