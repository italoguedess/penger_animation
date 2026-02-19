local Point = require("point")
local Cube = require("cube")
local Penger = require("penger")

function love.load()
	local screen_width, screen_height = love.graphics.getDimensions()
	FPS = 60
	Center = Point.create({ x = screen_width / 2, y = screen_height / 2, z = 0 })

	Points = Penger.Points
	Faces = Penger.Faces
	Angle = 2 * math.pi * (1 / FPS)
end

function love.update()
	love.timer.sleep(1 / FPS)
end

function love.draw()
	for i = 1, #Penger.Points, 1 do
		Points[i] = Point.y_rotation(Points[i], Angle)
		-- Points[i] = Point.x_rotation(Points[i], Angle)
		-- Points[i] = Point.z_rotation(Points[i], -Angle / 3)
	end

	local projected_points = {}
	local dz = 1
	for _, face in ipairs(Faces) do
		for i = 1, #face, 1 do
			table.insert(
				projected_points,
				Point.rebase(Point.project(Point.z_translation(Points[face[i]], dz)), Center).x
			)
			table.insert(
				projected_points,
				Point.rebase(Point.project(Point.z_translation(Points[face[i]], dz)), Center).y
			)
			-- Wrap back to the first point
			if i == #face then
				table.insert(
					projected_points,
					Point.rebase(Point.project(Point.z_translation(Points[face[1]], dz)), Center).x
				)
				table.insert(
					projected_points,
					Point.rebase(Point.project(Point.z_translation(Points[face[1]], dz)), Center).y
				)
			end
		end
	end

	love.graphics.line(projected_points)
end
