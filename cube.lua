local Point = require("point")

local x_dist = 0.2
local y_dist = 0.2

local Cube = {}
Cube.Points = {}
Cube.Faces = {}

Cube.Points[1] = Point.create({ x = x_dist / 2, y = y_dist / 2, z = 0.25 })
Cube.Points[2] = Point.create({ x = -x_dist / 2, y = y_dist / 2, z = 0.25 })
Cube.Points[3] = Point.create({ x = -x_dist / 2, y = -y_dist / 2, z = 0.25 })
Cube.Points[4] = Point.create({ x = x_dist / 2, y = -y_dist / 2, z = 0.25 })

Cube.Points[5] = Point.create({ x = x_dist / 2, y = y_dist / 2, z = 0 })
Cube.Points[6] = Point.create({ x = -x_dist / 2, y = y_dist / 2, z = 0 })
Cube.Points[7] = Point.create({ x = -x_dist / 2, y = -y_dist / 2, z = 0 })
Cube.Points[8] = Point.create({ x = x_dist / 2, y = -y_dist / 2, z = 0 })

Cube.Faces = {
	{ 1, 2, 3, 4 },
	{ 5, 6, 7, 8 },
	{ 1, 5 },
	{ 2, 6 },
	{ 3, 7 },
	{ 4, 8 },
}

return Cube
