-- 클래스에 대한 내용
-- 이를 진행하기 전,, 강좌 제작자가 미리 구현한 classic.lua 사용
function love.load()
    -- 외부 스크립트는 require()로, 클래스는 require ""로 호출하는 듯
    Object=require "classic"            -- 이걸 로드하는 이유? lua는 기본적으로 클래스를 지원하지 않아 클래스를 흉내내기 위함
    require "StudyAboutClass.rectangle"
    require "StudyAboutClass.shape"
    require "StudyAboutClass.circle"

    r1=Rectangle(100, 100, 200, 50)          --해당 구문 실행시 Rectangle.new가 자동으로 실행되어 r1에 저장됨
    r2=Rectangle(350, 80, 25, 140)
    r3=Circle(350, 80, 40)

    print(r1.test, r2.test)
    --실행 결과는 1~1000 사이의 랜덤한 숫자가 출력됨.
end

function love.update(dt)
    r1.update(r1, dt)           --클래스 내에서 update를 선언해도, 결국 main에서 끌어써서 호출해야하는 식인듯.
    r3:update(dt)
    --r1을 넣어주는건, self에 대한 처리때문. 파이썬마냥self가 자동으로 처리되는건 아닌가봄
end

function love.draw()
    r1:draw()                   --. 대신 :으로 내부 프로퍼티에 접근한다면 self는 공란으로 생략해도 됨
    --r2:draw()
    --r3:draw()
    --그리고 이 :은 클래스 자체에서도 선언하여 함수 생성할 때 self를 생략할 수 있음
    --function Rectangle:update(dt) 이런 식
    --이를 보고 Syntactic sugar라고 부름. 코드의 가독성을 높여주는 구문을 뜻함.
end


--[[
function love.load()
    -- 외부의 스크립트는 require를 이용해 불러올 수 있음
    require("localFunc")
    -- 외부 함수는 별도의 인스턴스 선언 없이 전역함수처럼 호출 가능
    print(calculator(1,2,0))

    -- 리턴이 존재하는 스크립트의 경우, 임의의 변수에 할당해줌
    local value=require("dataScript.localData")
    -- 임의의 변수에 받아낸 리턴을 출력하는 모습
    print("value==",value)
end
]]--