Square=Shape:extend()

function Square:new(x, y, sx, sy, speed)
    Square.super.new(self, x, y)            --super는 부모를 뜻함. 즉, 부모인 Shape의 new를 활용함
    self.sx=sx
    self.sy=sy
    self.speed=speed

    self.leftInput=false
    self.rightInput=false
    self.upInput=false
    self.downInput=false
end

function Square:draw()
    imgSrc=love.graphics.newImage("Sources/Sprites/Refresh0529_16.png")
    love.graphics.draw(imgSrc, self.x, self.y, 0, self.sx, self.sy)
end

function Square:update(dt)
    -- 방향키 입력에 따른 이동 처리
    if self.leftInput then
        self.x=self.x-self.speed*dt
        self.leftInput=false
        print("leftOff")
    end
    if self.rightInput then
        self.x=self.x+self.speed*dt
        self.rightInput=false
        print("rightOff")
    end
    if self.upInput then
        self.y=self.y-self.speed*dt
        self.upInput=false
        print("upOff")
    end
    if self.downInput then
        self.y=self.y+self.speed*dt
        self.downInput=false
        print("downOff")
    end
end

function Square:keypressed(key)
    --키 입력 처리
    if key=="left" then
        self.leftInput=true
        print("leftOn")
    end
    if key=="right" then
        self.rightInput=true
        print("rightOn")
    end
    if key=="up" then
        self.upInput=true
        print("upOn")
    end
    if key=="down" then
        self.downInput=true
        print("downOn")
    end
end