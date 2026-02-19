local Point = {}

Point.err = {
	OK = 0,
	ERR_DIVISION_BY_0 = 1,
}

function Point.create(new_point)
	local np = new_point or {
		x = 0,
		y = 0,
		z = 0,
	}

	return setmetatable(np, Point)
end

function Point.__add(p1, p2)
	local sum = Point.create()
	sum.x = p1.x + p2.x
	sum.y = p1.y + p2.y
	sum.z = p1.z + p2.z
	return sum
end

function Point.__sub(p1, p2)
	local sum = Point.create()
	sum.x = p1.x - p2.x
	sum.y = p1.y - p2.y
	sum.z = p1.z - p2.z
	return sum
end

function Point.project(p)
	if p.z == 0 then
		return Point.err.ERR_DIVISION_BY_0
	end
	local projected = Point.create()
	projected.x = p.x / p.z
	projected.y = p.y / p.z
	return projected
end

function Point.rebase(p, c)
	local rebased = Point.create()
	rebased.x = (p.x + 1) * c.x
	rebased.y = (-p.y + 1) * c.y
	return rebased
end

function Point.x_rotation(p, ang)
	local rotated = Point.create()
	local cos = math.cos(ang)
	local sin = math.sin(ang)
	rotated.x = p.x
	rotated.y = p.y * cos - p.z * sin
	rotated.z = p.y * sin + p.z * cos
	return rotated
end

function Point.y_rotation(p, ang)
	local rotated = Point.create()
	local cos = math.cos(ang)
	local sin = math.sin(ang)
	rotated.x = p.x * cos + p.z * sin
	rotated.y = p.y
	rotated.z = -p.x * sin + p.z * cos
	return rotated
end

function Point.z_rotation(p, ang)
	local rotated = Point.create()
	local cos = math.cos(ang)
	local sin = math.sin(ang)
	rotated.x = p.x * cos - p.y * sin
	rotated.y = p.x * sin + p.y * cos
	rotated.z = p.z
	return rotated
end

function Point.z_translation(p, dz)
	local translated = Point.create({ x = p.x, y = p.y, z = p.z + dz })
	return translated
end

return Point
