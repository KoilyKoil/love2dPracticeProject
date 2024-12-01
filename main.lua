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