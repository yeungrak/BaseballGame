//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 최영락 on 3/19/25.
//

class BaseballGame {
    
    func mainscreen() {
        //안내 문구 출력, 입력
        while true{
            print("환영합니다 :) 원하시는 번호를 입력해주세요.")
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            let mainScreenNumber = readLine() ?? ""
            switch mainScreenNumber {
            //1번을 입력하여 게임 시작하기 실행시 start()함수로 가서 게임 시작
            case "1":
                start()
           //게임 기록 불러오기 미구현
            case"2":
                print("게임 기록을 불러옵니다.")
                return
            case"3":
                print("게임을 종료 합니다.")
                return
            default:
                print("번호를 입력하세요!")
                continue
            }
        }
    }
    
    func start() {
        let answer = makeAnswer()
        print("게임을 시작합니다!")
        print("0~9의 숫자를 입력하세요!")
        print("입력: ", terminator: "" )
        while true {
            //기본값인 ""을 넣으면서 옵셔널을 언래핑함과 동시에 userNumber 상수에 유저가 넣은 readLine을 저장
            let userNumber = readLine() ?? ""
            //userNumberChange 상수에 compactoMap 함수를 이용해 int가 아닌 nil들을 제거하며 각 문자를 한글자씩 순회하며
            //Int로 변환시켜줌. 그리고 변환 시킨 값들로 배열을 생섬함.
            let userNumberChange = userNumber.compactMap { Int(String($0))}
            //만약 3자리가 아닐경우 (예외상황)
            if userNumberChange.count != 3 {
                print("[error] 3자리 숫자를 입력해주세요!: ", terminator: "")
                continue
            }
            //만약 중복된 값이 있는경우 (예외상황)
            if Set(userNumberChange).count != 3 {
                print("[error] 중복된 값을 입력하면 안됩니다!: ", terminator: "" )
                continue
            //만약 인덱스 0번째 자리에 0이 있을경우 (예외상황)
            }
            if userNumberChange[0] == 0 {
                print("[error] 첫자리수에'0'을 입력하면 안됩니다!: ", terminator: "" )
                continue
            }
            //checkAnswer 함수에 매개변수의 값을 입력해줌
            checkAnswer(userChoice: userNumberChange, competuerChoice: answer)
            //만약 userNumberChange와 랜덤으로 만든 answer가 같을때 중지 틀렸을때는 다시 돌아가기.
            if userNumberChange == answer {
                print("정답입니다!")
                break
            } else {
                print("다시 입력해주세요: ", terminator: "")
            }
        }
    }
    
    //답 만들기: answerList를 shuffle하여 answer 변수 배열에 저장
    func makeAnswer() -> [Int] {
        var answerList: [Int] = [0,1,2,3,4,5,6,7,8,9]
        var answerentry: [Int] = []
        answerList.shuffle()
        //변수 answerentry에 shuffle한 answerList의 0,1,2번째 인덱스의 값을 추가
        answerentry.append(answerList[0])
        answerentry.append(answerList[1])
        answerentry.append(answerList[2])
        //첫번째 자리에 0이 나올경우 첫번째있는 숫자를 삭제하고 뒤에 answerList의 4번째에 있는 숫자를 넣는다.
        if answerentry[0] == 0 {
            answerentry.append(answerList[3])
            answerentry.removeFirst()
        }
        return answerentry
    }
    func checkAnswer(userChoice: [Int], competuerChoice: [Int]) {
        //스트라이크,볼 변수 생성
        var strike = 0
        var ball = 0
        //userChoice[i] == competuerChoice[i] 부분을 추가하여
        //userChoice와 competuerChocie의 인덱스를 0부터 i까지의 숫자를 비교해서 만약 같은 순서에 같다면 strike += 1을 한다.
        for i in 0..<3 {
            if userChoice[i] == competuerChoice[i] {
                strike += 1
            } else if competuerChoice.contains(userChoice[i]) {
                ball += 1
            }
        }
        print("스트라이크: \(strike), 볼: \(ball)")
    }
    
    
    
}
