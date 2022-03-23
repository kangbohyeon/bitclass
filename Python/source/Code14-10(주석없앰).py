import pygame
import random
import sys

### 함수 선언 부분 ###
def playGame() :
    global monitor

    r = random.randrange(0,256)
    g = random.randrange(0,256)
    b = random.randrange(0,256)
        
    # 무한 반복함.
    while  True :
        (pygame.time.Clock()).tick(50)  # 게임 진행을 늦춰 줌(10~100 정도가 적당)
        monitor.fill( (r, g, b) ) # 화면 배경 칠하기

        # 키보드나 마우스 이벤트가 들어오는 것을 체크
        for e in pygame.event.get() :
            if e.type in [pygame.QUIT]  : # <X> 누르면  종료
                pygame.quit()
                sys.exit()

        pygame.display.update() # 화면 업데이트하기.
        print('~', end='')  # 게임 진행 확인

### 전역 변수 선언 부분 ###
swidth, sheight = 500, 700 # 화면 크기
monitor = None # 게임 화면

### 메인 코드 부분 ###
pygame.init()
monitor = pygame.display.set_mode( (swidth, sheight) )
pygame.display.set_caption('우주괴물 무찌르기')

playGame()
