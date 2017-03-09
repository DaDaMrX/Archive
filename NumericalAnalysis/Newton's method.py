x = float(input('Input the initial value:\nx0 = '))
s = input('Input the iterative formula:\nphi(x) = ')
f = lambda x: eval(s)
eps = float(input('Input the errors:\neps = '))
while True:
    x2 = f(x)
    if abs(x2 - x) < eps: break;
    x = x2
print('{:.6f}'.format(x))
