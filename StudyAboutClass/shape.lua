Shape=Object:extend()               -- 똑같이 클래스로 만들기 위해 선언. 여기선 :를 써 self를 생략한 것이 포인트

function Shape:new(x, y)
    self.x=x
    self.y=y
    self.speed=100
end

function Shape:update(dt)
    self.x=self.x+self.speed*dt
end