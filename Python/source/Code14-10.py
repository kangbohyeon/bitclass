import pygame
import random
import sys

## 함수 선언 부분 ##
# @기능 2-5 : 매개변수로 받은 객체를 화면에 그리는 함수를 선언한다.
# @기능 5-4 : 점수를 화면에 쓰는 함수를 선언한다.

def playGame() :
    global monitor

    r = random.randrange(0, 256)
    g = random.randrange(0, 256)
    b = random.randrange(0, 256) 
    
    # @기능 2-2 : 우주선의 초기 위치 키보드를 눌렀을 때 이동량을 저장할 변수를 선언한다.
    # @기능 3-2 : 우주괴물을 무작위로 추출하고 크기와 위치를 설정한다.
    # @기능 4-2 : 미사일 좌표를 초기화한다.
    # @기능 5-1 : 맞힌 우주괴물 숫자를 저장할 변수를 선언한다.

    # 무한 반복
    while True :
        (pygame.time.Clock()).tick(50)  # 게임 진행을 늦춰 줌(10~100 정도가 적당).
        monitor.fill((r, g, b))              # 화면 배경을 칠함.

        # 키보드나 마우스 이벤트가 들어오는지 체크한다.
        for e in pygame.event.get() :
            if e.type in [pygame.QUIT]  :
                pygame.quit()
                sys.exit()

            # @기능 2-3 : 방향키에 따라 우주선이 움직이게 한다.
                # @기능 4-3 : 스페이스바를 누르면 미사일을 발사한다.

        # @기능 2-4 : 우주선이 화면 안에서만 움직이게 한다.
        # @기능 3-3 : 우주괴물이 자동으로 나타나 왼쪽에서 오른쪽으로 움직인다.
        # @기능 4-4 : 미사일을 화면에 표시한다.
            # @기능 5-2 : 우주괴물이 미사일에 맞았는지 체크한다.
        # @기능 5-3 : 점수를 화면에 쓰는 함수를 호출한다.

        # 화면을 업데이트한다.
        pygame.display.update()
        print('~', end = '')

        
## 전역 변수 선언 부분 ##
r, g, b = [0] * 3                # 게임 배경색
swidth, sheight = 500, 700  # 화면 크기
monitor = None               # 게임 화면

# @기능 3-1 : 무작위로 사용할 우주괴물이 이미지 10개를 준비한다.


## 메인 코드 부분 ##
pygame.init()
monitor = pygame.display.set_mode((swidth, sheight))
pygame.display.set_caption('우주괴물 무찌르기')

# @기능 2-1 : 우주선 이미지를 준비하고 크기를 구한다.
# @기능 4-1 : 미사일 이미지를 추가한다.

playGame()
