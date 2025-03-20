//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 최영락 on 3/19/25.
//

class BaseballGame {
    func start() {
        let answer = makeAnswer()
        print("게임을 시작합니다!")
        print("1~9의 숫자를 입력하세요!")
        print("입력: ", terminator: "" )
        while true {
            // 1. 유저에게 입력값을 받음
            
            // 2. 정수로 변환되지 않는 경우 반복문 처음으로 돌아가기
            
            // 3. 세자리가 아니거나, 0을 가지거나 특정 숫자가 두번 사용된 경우 반복문 처음으로 돌아가기
            
            // 4. 정답과 유저의 입력값을 비교하여 스트라이크/볼을 출력하기
            // 만약 정답이라면 break 호출하여 반복문 탈출
            let usernumber = readLine() //옵셔널을 까주고 = string 이 나오면 string->int로 바꿔줘야함
            let readLineInt = [Int](usernumber)
        }
    }
    
    //답 만들기: answerList를 shuffle하여 answer 변수 배열에 저장
    func makeAnswer() -> [Int] {
        var answerList: [Int] = [1,2,3,4,5,6,7,8,9]
        var answerentry: [Int] = []
        answerList.shuffle()
        answerentry.append(answerList[0])
        answerentry.append(answerList[1])
        answerentry.append(answerList[2])
        print(answerentry)
        return answerentry
    }
    
}



