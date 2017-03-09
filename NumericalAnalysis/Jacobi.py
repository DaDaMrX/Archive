'''
Jacobi迭代法
INPUT
1. 矩阵阶数n
2. 系数矩阵A
3. 常数项B
4. 精度要求eps
OUTPUT
解X
'''
from math import log
class Jacobi(object):

    def __init__(self, n, A, B, eps):
        self.__n = n
        self.__A = A
        self.__B = B
        self.__eps = eps
        self.__change()
        norm = self.__norm(self.__A)
        self.__k = norm / (1 - norm)

    def __change(self):
        for i in range(self.__n):
            t = self.__A[i][i]
            self.__A[i] = list(map(lambda x: -x / t, self.__A[i]))
            self.__A[i][i] = 0.0
            self.__B[i] /= t

    def __add(self, A, B):
        return list(map(sum, zip(A, B)))

    def __sub(self, A, B):
        return list(map(lambda t: t[0] - t[1], zip(A, B)))

    def __mul(self, A, X):
        C = []
        for i in range(self.__n):
            C.append(sum(map(lambda t: t[0] * t[1], zip(A[i], X))))
        return C

    def __norm(self, A):
        if isinstance(A[0], list):
            return max([sum(map(abs, l)) for l in A])
            pass
        elif isinstance(A[0], float):
            return max(map(abs, A))

    def solve(self):
        self.__X = [0] * self.__n
        while True:
            X = self.__add(self.__mul(self.__A, self.__X), self.__B)
            if self.__k * self.__norm(self.__sub(X, self.__X)) < self.__eps: break
            self.__X = X

        digits = abs(round(log(self.__eps, 10)))
        return list(map(lambda x: round(x, digits), self.__X))

def inputs():
    n = int(input())
    A = []
    B = []
    for i in range(n):
        l = list(map(float, input().split()))
        A.append(l[:n])
        B.append(l[-1])
    eps = float(input())
    return n, A, B, eps

def main():
    n, A, B, eps = inputs()
    jacobi = Jacobi(n, A, B, eps)
    X = jacobi.solve()
    for x in X:
        print(x)

if __name__ == '__main__':
    main()

'''
INPUT
4
10 -1 2 0 6
-1 11 -1 3 25
2 -1 10 -1 -11
0 3 -1 8 15
0.0001

OUTPUT
1.0
2.0
-1.0
1.0

'''