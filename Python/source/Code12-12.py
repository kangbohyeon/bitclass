import threading
import time

class RunningHorse :
    horseName = ''
    def  __init__(self, name) :
        self.horseName = name
    def runHorse(self) :
        for _ in range(0, 3) :
            print(self.horseName)
            time.sleep(0.1)

horse1 = RunningHorse('@얼룩말')
horse2 = RunningHorse('#조랑말')
thread1 = threading.Thread(target = horse1.runHorse)
thread2 = threading.Thread(target = horse2.runHorse)
thread1.start()
thread2.start()

