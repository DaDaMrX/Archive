class Crout(object):
    
    def __init__(self, n, a):
        self.__n = n
        self.__a = a

    def __print_matrix(self):
        for row in self.__a:
            for x in row:
                print('{:.6f}'.format(x), end=' ')
            print()
        print()

    def __print_ans(self):
        ans = self.__ans
        for i in range(len(ans)):
            print('x{} = {:.6f}'.format(i + 1, ans[i]))
        print()

    def __get_l(self, method, a):
        if method in ['Gauss', 'Gauss_col']:
            return 1
        if method == 'Crout':
            return a
        if method == 'Sqrt':
            return a**(1 / 2)

    def __get_max(self, i):
        a = self.__a
        n = self.__n
        maxi = i
        for k in range(i + 1, n):
            if abs(a[k][i]) > abs(a[maxi][i]):
                maxi = k
        return maxi

    def __eliminate(self, method, display):
        n = self.__n
        a = self.__a

        if display:
            print('{} Elimination'.format(method))
            print('-----------------')
            print('The augmented matrix:')
            self.__print_matrix()
            
        for i in range(n):
            if display:
                print('Step {}:'.format(i + 1))

            #1: Get l[i][i]
            if method == 'Gauss_col':
                maxi = self.__get_max(i)
                a[i], a[maxi] = a[maxi], a[i]
                if display:
                    print('Main variable is {:.6f}'.format(a[i][i]))
            l = self.__get_l(method, a[i][i])
            if display:
                print('l[{0}][{0}] = {1:.6f}'.format(i + 1, l))

            #2: Deal the i-th row
            a[i][i:] = list(map(lambda x: x / l, a[i][i:]))
            if display:
                self.__print_matrix()

            #3: Deal from the i+1-th to the last row
            for j in range(i + 1, n):
                if method in ['Gauss', 'Crout', 'Gauss_col']:
                    l = a[j][i] / a[i][i]
                elif method == 'Sqrt':
                    l = a[i][j]
                if display:
                    print('l[{}][{}] = {:.6f}'.format(j + 1, i + 1, l))
                a[j][i] = 0
                a[j][i + 1:] = list(map(lambda t: t[1] - l * t[0], zip(a[i][i + 1:], a[j][i + 1:])))
            if display:
                self.__print_matrix()

    def __substitute(self):
        n = self.__n
        a = self.__a
        ans = []
        for i in range(n - 1, -1, -1):
            x = (a[i][-1] - sum(map(lambda t: t[0] * t[1], zip(a[i][i+1:], ans)))) / a[i][i]
            ans.insert(0, x)
        return ans

    def solve(self, *, method = 'Gauss', display = False):
        self.__eliminate(method, display)
        self.__ans = self.__substitute()

    def solution(self):
        print('The row echelon form:')
        self.__print_matrix()
        print('The solution:')
        self.__print_ans()

def inputs():
    print('Input the number of variables and equations:')
    n = int(input('n = '))

    print('Input the augmented matrix:')
    a = []
    for i in range(n):
        a.append(list(map(float, input().split())))

    print('Input the method to use (Gauss/Crout/Sqrt/Causs_col)?')
    method = input('Method = ')
    return n, a, method

def main():
    n, a, method= inputs()
    crout = Crout(n, a)
    crout.solve(method = method, display = True)
    crout.solution()

if __name__ == '__main__':
    main()
