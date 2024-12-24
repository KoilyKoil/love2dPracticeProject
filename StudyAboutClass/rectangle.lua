Rectangle=Object.extend(Object)  --이 문구가 rectangle을 클래스화시켜줌. 일전에 생성한 classic.lua를 상속시켜 클래스처럼 사용하는 느낌
-- 클래스화된 Rectangle변수는 main.lua에서 이 rectangle을 require만 하면 그대로 사용할 수 있음
-- 그래서 main.lua에서 각 변수에 Rectangle 클래스 객체를 선언하고, test 함수를 선언한 것

--function Rectangle.new(self)
--위와 같은 식이 기본 선언
--아래와 같은 식으로 매개변수를 받을 수 있음
function Rectangle:new(x, y, width, height)            --클래스 객체가 새로 생성됐을 때 처리. 일종의 초기화과정인듯?
    self.test=math.random(1,1000)       --다른 코드에서 Rectangle.test를 실행할 때 진행해줄 처리 설정    
    self.x=x
    self.y=y
    self.width=width
    self.height=height
    self.speed=100
end

function Rectangle.update(self, dt)
    self.x=self.x+self.speed*dt
end

function Rectangle.draw(self)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end