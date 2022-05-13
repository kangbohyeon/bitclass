import numpy as np
import matplotlib.pyplot as plt


def mae(yp, y):
    return np.mean(np.abs(yp - y))


def mse(yp, y):
    return np.mean(sum(yp - y) ** 2)


def gradient(ys, xs, w, b):
    yp = w * xs + b
    error = ys - yp
    wd = -(2 / len(xs)) * sum(xs * error)
    bd = -(2 / len(xs)) * sum(error)
    return wd, bd


def gradient_descent(xs, ys, lr=0.001, epochs=1000):
    wphl = []  # 학습 과정에서의 가중치와 편향을 보관
    wp = np.random.uniform(-1, 1)  # 초기 가중치를 랜덤하게 설정
    bp = np.random.uniform(-1, 1)  # 초기 편향을 랜덤하게 설정
    for epoch in range(epochs):
        wd, bd = gradient(ys, xs, wp, bp)  # 가중치와 편향의 기울기를 계산
        wp = wp - (wd * lr)
        bp = bp - (bd * lr)
        wphl.append([wp, bp])
    return wp, bp, wphl  # 가중치 ,편향, 히스토리 반환


ex = [2, 4, 7, 1, 9, 6]
ex_ys = [8, 11, 24, 5, 30, 20]
ex_xs = [[x] for x in ex]

ex_arr = np.array(ex)
ey_arr = np.array(ex_ys)
mses = []
for w in np.arange(-2, 5, 0.1):
    yp = w * ex_arr + 2
    mses.append(mse(yp, ey_arr))

wp, bp, wphl = gradient_descent(ex_arr, ey_arr)
for epoch, (wb, bd) in enumerate(wphl):
    print(f"epoch:{epoch:04d} w:{wb:10.2f} b:{bd:10.2f}")

min_val = min(min(ex_arr), min(ey_arr))
max_val = max(max(ex_arr), max(ey_arr))

for epoch, (wb, bd) in enumerate(wphl):
    plt.figure(figsize=(4, 4))
    plt.plot(ex_arr, ey_arr, '.', label='actual')
    sx = min_val
    sy = wb * sx + bd
    ex = max_val
    ey = wb * ex + bd
    plt.plot([sx, ex], [sy, ey], label=f'epoch:{epoch} y = {wb:.2f}x+{bd:.2f}')
    plt.xlim(min_val, max_val)
    plt.ylim(min_val, max_val)
    plt.legend()
    plt.show()
    if epoch == 500:
        break
