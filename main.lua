--Awake
function love.load()
    --변수의 선언 자체는 어디서 선언하든 다른 곳에서 사용할 수 있나봄?
    --다만 내가 임의로 선언한 함수보다는, 이런 내장함수에서 선언한 것들
    uptval=0
    lodval=0
    sumnum=0
    --++이나 +=1 안되는거 개불편하네....
    lodval=lodval+1

    sayNumber(15)
    sayNumber(2)
    sayNumber(44)
    sayNumber(100)
    sayNumber(sum(50, 25))

    --여기도 파이썬처럼 기본적으로 배열의 개념보단 리스트의 개념을 주로 채용하고 있음
    tabler={"uno", "dos"}
    --그래서 리스트에서 사용하는 개념이 똑같이 적용됨
    table.insert(tabler, "tres")
    table.insert(tabler, "넷")
    table.remove(tabler, 3)

    --오브젝트 처리(주석정리 필요)
    --https://sheepolution.com/learn/book/8
    rect={}
    rect["width"]=100
    rect.width=100
    rect.height=130
    rect.x=120
    rect.y=120

    rect.speed=100

    listOfRectangles={}
end

--Update
function love.update(dt)        --dt는 델타타임
    --조건문에 대해 공부함
    if uptval<100 then
        uptval=uptval+sumnum*dt
        sumnum=sumnum+10
    end

    --키입력 처리도 가능하고, elseif의 형식으로 이어주며 끝에 end만 붙여주면 됨
    if love.keyboard.isDown("down") then
        uptval=uptval+sumnum*dt
        sumnum=sumnum+10
    elseif love.keyboard.isDown("up") then
        uptval=uptval-sumnum*dt
        sumnum=sumnum-10
    end

    --오브젝트 처리(주석정리 필요)
    rect.x=rect.x+rect.speed*dt

    for i, v in ipairs(listOfRectangles) do
        v.x=v.x+v.speed*dt
    end
end

function love.draw()
    --그래픽 처리는 무조건 이곳에서 처리됨
    --다른 곳에서는 그래픽관련 함수는 전혀 안먹힘
    --그래서 변수를 다른 곳에서 처리해서 그래픽을 움직이게 하는 방법도 있음 
    love.graphics.rectangle("line", 100, uptval, 200, 150)
    love.graphics.rectangle("line", lodval, 50, 200, 150)

    --리스트의 길이는 #리스트명의 형태로 설정
    --이건 좀 편한 듯....
    for i=1, #tabler do
        love.graphics.print(tabler[i], 100*i, 100*i)
    end

    --i=1로 처리하면 에러가 뜸. 여기서 i는 인덱스 숫자를 표현하는 역할인가봄
    --결국 foreach문은 아래와 같이 작성하면 된다라는 것
    for i, temp in ipairs(tabler) do
        love.graphics.print(temp, 100*i, 100*i)
    end

    --오브젝트 처리(주석정리 필요)
    love.graphics.rectangle("line", rect.x, rect.y, rect.width, rect.height)

    for i, v in ipairs(listOfRectangles) do
        love.graphics.rectangle("line", v.x, v.y, v.width, v.height)
    end
end

function sayNumber(num)
    print("I like the number "..num)
end

function sum(a, b)
    return a+b
end

--오브젝트 처리(주석정리 필요)
function createRect()
    rect={}
    rect.width=100
    rect.height=130
    rect.x=120
    rect.y=120

    rect.speed=100
    
    table.insert(listOfRectangles, rect)
end

function love.keypressed(key)
    if key=="space" then
        createRect()
    end
    
end