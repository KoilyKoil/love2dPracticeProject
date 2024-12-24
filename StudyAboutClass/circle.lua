Circle=Shape:extend()

function Circle:new(x, y, radius)
    Circle.super.new(self, x, y)            --super는 부모를 뜻함. 즉, 부모인 Shape의 new를 활용함
    self.radius=radius
end

function Circle:draw()
    love.graphics.circle("line", self.x, self.y, self.radius)
end